//all the layers neurons etc are used here 
class neuralNetwork{
    
    float inpts[];
    float outputs[];
    neuralNetwork(float[] inputs, float[] weights){

        
        this.inpts = inputs;

    }

    //set the input nodes to the input values
    void setInputs(float[] inpts){
        
        layers.get(0).setIn(inpts);
    }

    void setWeights(){


    }

    float[] think(){
        

        return ;
    }

    


}