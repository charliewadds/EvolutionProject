float startX = 100;
float startY = 250;
population pop;
goal fin;
float fitnessAdj;
void setup(){

    size(1000, 500);
    //start = new Dot();
    pop = new population(1000);
    fin = new goal(900,250);
    fitnessAdj = dist(startX,startY,fin.x,fin.y);
    println("setup");

}


void draw(){
    background(255);
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
