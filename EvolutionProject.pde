float startX = 100;//start position for the dots 
float startY = 250;//TODO make this random withis a given area for a more robust algorithm
//int loopCount = 0;
//list of obstacles in the world
ArrayList<obstacle> obst = new ArrayList<obstacle>();

population pop;

goal fin;

float fitnessAdj;

/**
  this will run once at the start of the program
  initialize the goal, obstacles, window and population
*/
void setup(){


   
    fin = new goal(700,100); 
    
    //obst.add(new obstacle(600,400,700,50));
    //obst.add(new obstacle(500,200,50,200));

    obst.add(new obstacle(300,250,50,300));
    obst.add(new obstacle(500,100,50,300));

    
    
    size(1000, 500, P2D);//initialize window
    
    
    pop = new population(400);
    
    
    

}


/**
loops every time the window has a new frame
this is where everything "comes together"

*/
void draw(){
    //fin = new goal(700 + (random(200)-100),100);
    //background(255);
    textSize(32);
    text(pop.generation, 10, 30);//display the generation on the window
    fill(0,255,0);
    text(pop.fitnessSumOut, 100, 30); //display the sum of the fitnesses to give an idea of how the algorithm is working as a whole
    
    //loop through all the obstacles and show them on the window
    for(obstacle i:obst){
    i.show();
    }
    
    fin.show();//show the goal
    
     //<all the dots dead?>//
    if(pop.allDead()){
      //pop.calculateFitness(); //<calculate and update each dot's fitness>//
      pop.naturalSelection(); //apply a simplified version of the NEAT (NeuroEvolution of Augmenting Topologies) algorithm 
      pop.mutateChildren();   //TODO this needs a new name
      fin = new goal(700 + (random(200)-100),100 + (random(200)-100));
        background(255);
    }else{
    pop.update();
    
    pop.show();
    
    }


}
