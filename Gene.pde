//TODO make this use NN
//this is kinda garbage but it works
class Gene{
    float[] weights;//the number of weight is the same as the number of connections in this case 44
    //neuralNetwork net;
    
    int step = 0;//tf is this

    Gene(int size){

        weights = new float[size]; 
        randomise();


    } //<>//

    void randomise(){

        for(int i=0; i<weights.length; i++){
            float randWeight = (float)(Math.random() *2)-1;
            weights[i]= randWeight;//add a move to the weights list based on a random angle
            //print(weights[i]);

        }

    }    


    void mutate(){
        float mutationRate = 0.01;//1% of all "genes" in this case weights are changed
        for(int i=0; i<weights.length; i++){
            float rand = random(1);//random number from 0 to 1
            if(rand<mutationRate){//1% of the time
                float randAngle = (float)(Math.random() *2)-1;//between -1 and 1
                weights[i]= randAngle;

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
