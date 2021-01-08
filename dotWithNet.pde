float startX = 100;
float startY = 250;
ArrayList<obstacle> obst = new ArrayList<obstacle>();
population pop;
goal fin;
float fitnessAdj;
void setup(){
    obst.add(new obstacle(250,312,50,400));
    obst.add(new obstacle(500,150,50,400));
    obst.add(new obstacle(750,312,50,400));
    
    size(1000, 500);
    //start = new Dot();
    pop = new population(5000);
    fin = new goal(900,250);
    fitnessAdj = dist(startX,startY,fin.x,fin.y);
    println("setup");

}
//test new branch2

void draw(){
    background(255);
    textSize(32);
    text(pop.generation, 10, 30); 

    obst.get(0).show();//TODO make this show all obstacles
    obst.get(1).show();//TODO make this show all obstacles
    fin.show();
    fin.show();
    if(pop.allDead()){
      pop.calculateFitness(); //<>//
      pop.naturalSelection();
      pop.mutateChildren();
        
    }else{
    pop.update();
    pop.show();
    }


}
