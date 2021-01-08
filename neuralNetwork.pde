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

    ArrayList<Float> think(float[] weights){
        println("hello from neuralNetowrk.think");
        ArrayList<Float> out = new ArrayList<Float>();
        
        for(int i=0;i<layers.size();i++){

            layers.get(i).generateConnects(weights);
            println("hello from neuralNetowrk.think after generateConnects");
            layers.get(i).runNN();
            
            println("hello from neuralNetowrk.think after layers.get");
            if(layers.get(i).isOutput){
                for(int ii = 0;ii<layers.get(i).neurons.length;ii++){
                    
                    out.add(layers.get(i).neurons[ii].value);

                }
            }
        }
        println("hello from neuralNetowrk.think after everything");
        return out;
        

        
    }

    


}