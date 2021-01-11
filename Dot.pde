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
    Dot(){
        
        pos= new PVector(100, 500/2);//TODO hardcoding
        vel= new PVector(0,0); 
        acc= new PVector(0,0); //<>// //<>//
        gene = new Gene(24);//TODO this is hard coding
        senses = new float[10];
        myBrain = new neuralNetwork(senses,gene.weights);
        
        look(); //<>// //<>//
        
        myBrain.setInputs(senses);

    } //<>// //<>//
    
    

    void look(){//set senses
        
        senses[0]= dist(pos.x,pos.y,fin.x,fin.y)/900;//distance to the end TODO might want to inverse this
        senses[1]= 1;
        normalizeLook();
        raycast();
        


    } 
    void normalizeLook(){
      for(int i = 2; i< senses.length; i++){//start at 2 so only normalize raycasts
        senses[i] = senses[i]/200;


      }



    }
    void raycast(){

    int numRays = 4;
    float[] rays = new float[numRays];
    int i = 0;
    int ii = 0;
    int raylengths = 0;
    boolean found = false;
    float x = 0;
    float y = 0;
    float theta;
    float startX = pos.x;
    float startY = pos.y;
    while(i<numRays){//9 different rays+
      
      x=0;//x position of the end of the ray
      y=0;// y position of the end of the ray
    
      theta = 0;//angle in radians
      found = false;
      raylengths = 0;
      while(!found){
        
        theta +=0.436332;// add 40 degrees in radians
        x+= 10*Math.sin(theta);// x distance at the current angle
        //println(x);
        y+= 10*Math.sin(theta);// y distance at the current angle
        ii = 0;
        raylengths++;
        //print("x is: "); println(x);
        //print("y is: "); println(y);
        while(ii<obst.size()){//check all the obstacles
          
          if(obst.get(ii).hit(x,y)||(x<2||y<2||x>1000-2||y>500-2)){//if it hit an obstacle
           found = true;
           senses[i+1] = raylengths*10;
           
           //print("sense#:");
           //print(i+1);
           //print(" is: ");
           //println((raylengths*10));

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
      if(isBest){
        fill(0,255,0);
        ellipse(pos.x,pos.y,4,4);
      }else{
        noFill();
        ellipse(pos.x,pos.y,4,4);
      }
      
      //println(fitness);
    }

    void move(){
      //print(alive);
      if(moves>500){
        alive = false;
      }



      if(alive){
          moves++;  
          look();
          //acc = PVector.fromAngle(myBrain.think(gene.weights).get(0)*6.2);//TODO this is where the nn thinks
          //acc.x = (float)(Math.random() *2)-1;
          //acc.y = (float)(Math.random() *2)-1;
          acc.x = myBrain.think(gene.weights, senses).get(0);
          acc.y = myBrain.think(gene.weights, senses).get(1);
          //println(acc.x);
          //gene.step ++;
          
          vel.limit(6);
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
       //println(howFar);
       if(reached){
         //fitness = 1/(gene.step);
         fitness += 10000;
       }else{
         fitness = (float)(1/howFar);
         fitness += moves/20;
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
