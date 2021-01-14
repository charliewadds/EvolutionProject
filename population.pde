/**
  population class holds and coordinates all the dots effectiely an intermediary between the draw() and each individual dot



*/
class population{

  float fitnessSumOut = 0;//fitness sum to be displayed on the window
  Dot[] dots;//all the dots in the population
  int bestDot;//index of the best dot
  int generation=0;//how many times have all the dots "died"


  /**
    fill the dots array with new dots
    @param size       the number of dots in the population
  */
  population(int size){
    
    dots = new Dot[size];
    for(int i = 0; i<size; i++){
        dots[i]= new Dot();
      }
      
      
      
    
  }
  
  /**
    display each dot on the window
  */
  void show(){
   for(int i = 0; i<dots.length; i++){
      dots[i].show();
    } 
  }
  /**
    call update() and fitness() on each dot


  */
  void update(){
    
    for(int i = 0; i<dots.length; i++){
      dots[i].update();
      dots[i].fitness();
    } 
    //fitnessSum();
    
    
  }
  /**
    adds the fitnesses of all the dots 
  */
  void fitnessSum(){
    float sum = 0;
    for(int i = 0; i<dots.length; i++){
      sum += dots[i].fitness;
    } 
    fitnessSumOut =sum;
    

  }
  /**
  check each dot to make sure it is not dead or reached the end
  */
  boolean allDead(){
    
    for(int i = 0; i<dots.length; i++){
      if(dots[i].alive && !dots[i].reached){
        return false;
      }  
      
    } 
    
    return true;
    
    
  }
  /*
    a very simple implemenation of neuroevolution
    this will only update the weights of the neural network for now the structure is fixed(although it can be edited in the neuralNetwork class)
    this will create a copy of dots with the probability of each dot being duplicated determined by the fitness of that dot
    after this each dot will be "mutated" which consists of rancomly changing weights some small percentage of the time
  */
  void naturalSelection(){
    
    //Dot[] newGen  = new Dot[dots.length];
    setBestDot();
    //newGen[0] = dots[bestDot].makeChild(newGen[0]);
    //newGen[0].isBest = true;
    dots[0] = dots[bestDot].makeChild(dots[0]);
    dots[0].isBest = true;

    for(int i = 1; i<dots.length; i++){
      
      Dot parent = pickParent();//set a new parent based on the fitness

      dots[i] = parent.makeChild(dots[i]);//duplicate child
    } 
    if(generation %10 == 0){
      bigKill();
    }


    //dots = newGen;
    generation++;
  }

  void bigKill(){
      for(int i = 1; i<dots.length; i++){
          if(i%2==0){
            dots[i].gene.randomise();
          }
      }

  }

  /**
    pick a "parent" dot based on the fitness

  */
  Dot pickParent(){
    fitnessSum();
    float rand = random(fitnessSumOut);

    float runningSum =0;
    //print(runningSum);
    int i =0; //<>// //<>//
    while(i<dots.length){//TODO this better using weighted average.. i think
       runningSum += dots[i].fitness;
       if(runningSum>rand){
         return dots[i]; 
       } 
       

      i++;
    }
   return null;


  }
  
   /**
      change each gene a little bit
   */ 
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


  //population copy(){
  //  population newPop = new population();
      
  //}
}
