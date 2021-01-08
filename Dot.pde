class Dot{
    PVector pos;
    PVector vel;
    PVector acc;
    float fitness;
    Gene gene;
    boolean alive = true;
    boolean reached = false;
    boolean isBest = false;
    Dot(){
        
        pos= new PVector(100, 500/2);//TODO hardcoding
        vel= new PVector(0,0); 
        acc= new PVector(0,0);
        gene = new Gene(700);

    } //<>//
    
    
    void show(){
      if(isBest){
        fill(0,255,0);
        //ellipse(pos.x,pos.y,4,4);
      }else{
        noFill();
      }
      if(gene.step<=399){

        ellipse(pos.x,pos.y,4,4);
      }else{
                alive = false;//this should be in a different function 
          
        }
    }

    void move(){
    //  println(gene.directions.length);
    if(alive){
        if(gene.directions.length > gene.step){
            acc = gene.directions[gene.step];
            gene.step ++;
        }
        vel.limit(5);
        vel.add(acc);
        pos.add(vel);

    }

    }

    void update(){
        obstacleCheck();
        if(alive && !reached){
            move(); 
            if(pos.x<2||pos.y<2||pos.x>1000-2||pos.y>500-2){//kill if outside of display
                alive = false;
                
            }else if(dist(pos.x,pos.y,fin.x,fin.y)<5){
                reached = true; 
            }
        }else{
          
        }
    }

    void obstacleCheck(){
      int i = 0;
      while(i<obst.size()){
        if(obst.get(i).hit(pos.x,pos.y)){
          alive = false;
        }
        i++;
      }


    }
    
    void fitness(){
       float howFar = dist(pos.x,pos.y,fin.x,fin.y); 
       
       if(reached){
         fitness = 1/(gene.step);
         fitness += 10000;
       }else{
         fitness = (float)(fitnessAdj/howFar);
       }
       
               //fitness = (float)(fitnessAdj/howFar);
      
    }
    Dot makeChild(Dot parent1){//this is where in a more complex problem the genes from two parents would be combined idk how tf to do that so im using one parent
      Dot child = new Dot();
      child.gene = gene.clone();
      return child;


    }





}
