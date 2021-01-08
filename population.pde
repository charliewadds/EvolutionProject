class population{
  
  Dot[] dots;
    int bestDot;
  int generation=0;
  population(int size){
    
    dots = new Dot[size];
    for(int i = 0; i<size; i++){
      
      dots[i]= new Dot();
      
    }
      
      
      
    
  }
  
  
  void show(){
   for(int i = 0; i<dots.length; i++){
      dots[i].show();
    } 
  }
  void update(){
    
    for(int i = 0; i<dots.length; i++){
      dots[i].update();
    } 
    
    
  }
  
  void calculateFitness(){
    for(int i = 0; i<dots.length; i++){
      dots[i].fitness();
    }  //<>//
  } //<>//

  float fitnessSum(){
    float sum = 0;
    for(int i = 0; i<dots.length; i++){
      sum += dots[i].fitness;
    } 
    return sum;

  }
  
  boolean allDead(){
    
    for(int i = 0; i<dots.length; i++){
      if(dots[i].alive && !dots[i].reached){
        return false;
      }  
      
    } 
    
    return true;
    
    
  }
  
  void naturalSelection(){
     //<>//
    Dot[] newGen  = new Dot[dots.length];
    //setBestDot();
    //newGen[0] = dots[bestDot].makeChild(newGen[0]);
    //newGen[0].isBest = true;
    for(int i = 0; i<dots.length; i++){
      Dot parent = pickParent();

      newGen[i] = parent.makeChild(newGen[i]);
    } 


    dots = newGen;
    generation++;
  }


  Dot pickParent(){
    float rand = random(fitnessSum());

    float runningSum =0;

    int i =0; //<>//
    while(i<dots.length){
       runningSum += dots[i].fitness;
       if(runningSum>rand){
         return dots[i]; 
       } 

      i++;
    }
    println("NullPointerException...  jk pick parent loop is fucked have fun");
    return null;


  }
  //this name feels wrong...
   //<>//
  //another bad name 
  void mutateChildren(){
    for(int i = 0; i<dots.length; i++){
          dots[i].gene.mutate();


        } 


  }
  void setBestDot(){
     float max = 0;
     int maxIndex = 0;
     for(int i = 0; i<dots.length; i++){
          if(dots[i].fitness>max){
           max = dots[i].fitness;
           maxIndex = i;
          }


        } 
        bestDot = maxIndex;
  }
}
