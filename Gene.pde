//TODO make this use NN
//this is kinda garbage but it works
class Gene{
    float[] weights;//the number of weight is the same as the number of connections in this case 44
    //neuralNetwork net;
    
    

    Gene(int size){

        weights = new float[size]; 
        randomise();
        //TODO step to keep track of new mutations and not kill them

    } //<>//

    void randomise(){

        for(int i=0; i<weights.length; i++){
            //float randWeight = (float)(Math.random() *2)-1;
            float randWeight = (float)random(0.5)-.25;
            weights[i]= randWeight;//add a move to the weights list based on a random angle
            //weights[i]= 0;
            //print(weights[i]);

        }

    }    


    void mutate(){
        float mutationRate = 0.055;//5% of all "genes" in this case weights are changed
        float randRate = 0.005;//.05% of the time fully randomise gene
        for(int i=0; i<weights.length; i++){
            float rand = random(1);//random number from 0 to 1
            if(rand<randRate){
                float fullRand = (float)random(2)-1;//between -1 and 1 TODO dont need a new variable every time
                weights[i]+= fullRand;


            }
            else if(rand<mutationRate){//1% of the time
                float randAngle = (float)random(0.2)-.1;//between -.1 and .1
                weights[i]+= randAngle;

            }


        }

    }
    Gene clone(){

        Gene clone = new Gene(weights.length);
        for(int i=0; i<weights.length; i++){
            clone.weights[i]= weights[i];
        }
        return clone;
    }





}
