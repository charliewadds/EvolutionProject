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
    int moves = 0;
    float minDist = 1000;
    Dot(){
        
        pos= new PVector(100 +(random(100)-50), 250+ (random(100)-50));//TODO hardcoding
        vel= new PVector(0,0); 
        acc= new PVector(0,0); //<>// //<>//
        
        gene = new Gene(32);//TODO this is hard coding
        senses = new float[10];
        myBrain = new neuralNetwork(senses,gene.weights);
        
        look(); //<>// //<>//
        
        myBrain.setInputs(senses);

    } //<>// //<>//
    
    
    void minDist(){
      if(dist(pos.x,pos.y,fin.x,fin.y)<minDist){
        minDist = dist(pos.x,pos.y,fin.x,fin.y);
      }
    }
    void look(){//set senses
        
        senses[0]= Math.abs(pos.x-fin.x);//distance to the end TODO might want to inverse this
        senses[1]=Math.abs(pos.y-fin.y);
        senses[2]= 1;


        minDist();
        normalizeLook();
        raycast();
        


    } 
    void normalizeLook(){
      for(int i = 2; i< senses.length; i++){//start at 2 so only normalize raycasts
        senses[i] = 50/(senses[i]);


      }



    }
    void raycast(){
      //TODO this is rediculosly slow O(N^3) this could probobly be O(numObstacles*numRays)
    int numRays = 4;
    float[] rays = new float[numRays];
    int i = 0;
    int ii = 0;
    int raylengths = 0;
    boolean found = false;
    float x = 0;
    float y = 0;
    float theta = 0;
    float startX = pos.x;
    boolean printed = false;
    float startY = pos.y;
    while(i<numRays){//9 different rays+
      
      x =  pos.x;//x position of the end of the ray
      y =pos.y;// y position of the end of the ray
    
      //theta = 0;//angle in radians
      found = false;
      raylengths = 0;
      theta +=0.436332;// add 40 degrees in radians
      if(theta== 0.436332*9){
        theta = 0;
      }
      while(!found){//loop until hit
         
        
        // x distance at the current angle
        x+=10*(float)Math.sin(theta);
        y+= 10*(float)Math.sin(theta);// y distance at the current angle
        ii = 0;
        raylengths++;
        
        
        while(ii<obst.size()){//check all the obstacles
        
          if(obst.get(ii).hit(x,y)||(x<2||y<2||x>1000-2||y>500-2)){//if it hit an obstacle
            found = true;
            senses[i+3] = raylengths*10;
           //loopCount++;
            
          
            break;
          

          }
          ii++;
        }
      }


      i++;
    }

    }
     float tanh(float x) {
    float y = (float)Math.tanh(2*x);
    return y;
  }

    void show(){
      //print("show");
      if(!alive&& !isBest){
        fill(255,0,0);
      }
      if(isBest){
        fill(0,255,0);
       
      }
        ellipse(pos.x,pos.y,4,4);
        noFill();
      
      //println(fitness);
    }

    void move(){
      //print(alive);
      //if(moves>300){
      //  alive = false;
      //}



      if(alive){
          moves++;  
          look();
          
          acc.x = myBrain.think(gene.weights, senses).get(0);
          acc.y = myBrain.think(gene.weights, senses).get(1);
         
          
          
          vel.add(acc);
          vel.limit(10);
          pos.add(vel);

      }

    }

    void update(){
      
        obstacleCheck();
        if( moves >200){
          alive = false;
        }
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
         
         fitness += 10;
       }else{
         fitness = (float)(100/howFar);
         fitness += 50/minDist;
         //fitness += moves/40;
       }
       //println(fitness);
       
               //fitness = (float)(fitnessAdj/howFar);
      
    }
/*
    void fitness(){
       float howFar = dist(pos.x,pos.y,fin.x,fin.y); 
       fitness =(float) Math.pow(Math.pow((howFar*-1),2),(-1/100))+900;
      
    }

    */
    Dot makeChild(Dot parent1){//this is where in a more complex problem the genes from two parents would be combined idk how tf to do that so im using one parent
      Dot child = new Dot();
      child.gene = gene.clone();
      return child;


    }





}
