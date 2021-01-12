float startX = 100;//start position for the dots 
float startY = 250;//TODO make this random withis a given area for a more robust algorithm

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
    
    obst.add(new obstacle(500,400,700,50));
    obst.add(new obstacle(500,200,50,200));
    
    
    size(1000, 500);//initialize window
    
    
    pop = new population(300);
    
    
    

}


/**
loops every time the window has a new frame
this is where everything "comes together"

*/
void draw(){
    
    background(255);
    textSize(32);
    text(pop.generation, 10, 30);//display the generation on the window
    fill(0,255,0);
    text(pop.fitnessSumOut, 100, 30); //display the sum of the fitnesses to give an idea of how the algorithm is working as a whole
    
    //loop through all the obstacles and show them on the window
    for(obstacle i:obst){
    i.show();
    } 
    
    fin.show();//show the goal
    
     //<>//
    if(pop.allDead()){
      pop.calculateFitness(); //<>//
      pop.naturalSelection();
      pop.mutateChildren();
        
    }else{
    pop.update();
    
    pop.show();
    
    }


}
