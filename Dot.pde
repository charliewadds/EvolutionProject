class Dot{
    PVector pos;
    PVector vel;
    PVector acc;
    float fitness;
    Gene gene;
    boolean alive = true;
    boolean reached = false;
    boolean isBest = false;
    neuralNetwork myBrain;
    float[] senses;
    Dot(){
        
        pos= new PVector(100, 500/2);//TODO hardcoding
        vel= new PVector(0,0); 
        acc= new PVector(0,0); //<>//
        gene = new Gene(24);//TODO this is hard coding
        senses = new float[10];
        myBrain = new neuralNetwork(senses,gene.weights);
        
        look(); //<>//
        
        myBrain.setInputs(senses);

    } //<>//
    
    

    void look(){//set senses
        
        senses[0]= dist(pos.x,pos.y,fin.x,fin.y);//distance to the end
        
        raycast();
        


    }

    void raycast(){

    
    float[] rays = new float[9];
    int i = 0;
    int ii = 0;
    int raylengths = 0;
    boolean found = false;
    float x = 0;
    float y = 0;
    int theta;
    float startX = pos.x;
    float startY = pos.y;
    while(i<9){//9 different rays+
      
      x=0;//x position of the end of the ray
      y=0;// y position of the end of the ray
    
      theta = 0;//angle in radians
      found = false;
      raylengths = 0;
      while(!found){
        
        theta +=0.698132;// add 40 degrees in radians
        x+= 10*Math.sin(theta);// x distance at the current angle
        y+= 10*Math.sin(theta);// y distance at the current angle
        ii = 0;
        raylengths++;
        while(ii<obst.size()){//check all the obstacles
          
          if(obst.get(ii).hit(pos.x,pos.y)||(x<2||y<2||x>1000-2||y>500-2)){//if it hit an obstacle
           found = true;
           senses[i+1] = raylengths*10;

          }
          ii++;
        }
      }


      i++;
    }

    }

    void show(){
      //print("show");
      if(isBest){
        fill(0,255,0);
        ellipse(pos.x,pos.y,4,4);
      }else{
        //noFill();
      }
      if(gene.step<=399){

        ellipse(pos.x,pos.y,4,4);
      }else{
                alive = false;//this should be in a different function 
          
        }
    }

    void move(){
    
    if(alive){
            
        look();
        acc.x = myBrain.think(gene.weights).get(0);//TODO this is where the nn thinks
        acc.y = myBrain.think(gene.weights).get(1);
        //println(acc.x);
        //gene.step ++;
        
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
