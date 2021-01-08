float startX = 100;
float startY = 250;
ArrayList<obstacle> obst = new ArrayList<obstacle>();
population pop;
goal fin;
float fitnessAdj;
//ArrayList<layer>  layers = new ArrayList<layer>();
void setup(){


    //add the layers
    //layers.add(new layer(10,0));//10 inputs //<>//
    //layers.add(new layer(2,1));//TODO i think this has to go in neuralNetwork class
    //layers.add(new layer(2,2));//2 output neurons one for x and one for y of a PVector

    //add the obstacles
    fin = new goal(900,250); //<>//
    
    obst.add(new obstacle(250,312,50,400));
    obst.add(new obstacle(500,150,50,400));
    obst.add(new obstacle(750,312,50,400));
    
    size(1000, 500);
    //start = new Dot();
    
    pop = new population(500);
    
    fitnessAdj = dist(startX,startY,fin.x,fin.y);
    

}
//test new branch5

void draw(){
   
    background(255);
    textSize(32);
    text(pop.generation, 10, 30);
    fill(0,255,0);
    text(pop.fitnessSumOut, 100, 30); 
    
    for(obstacle i:obst){
    i.show();//TODO make this show all obstacles
    //obst.get(1).show();//TODO make this show all obstacles
    //obst.get(2).show();//TODO make this show all obstacles
    } 
  
    fin.show();
    fin.show();
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
