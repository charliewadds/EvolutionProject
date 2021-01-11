//all the layers neurons etc are used here 
class neuralNetwork{
     //add the layers
    ArrayList<layer>  layers = new ArrayList<layer>();
    float inpts[];
    float outputs[];
    neuralNetwork(float[] inputs, float[] weights){
       
    layers.add(new layer(6,0,false));//10 inputs
    layers.add(new layer(2,1,false));//TODO i think this has to go in neuralNetwork class
    layers.add(new layer(2,2,true));//2 output neurons one for x and one for y of a PVector
        this.inpts = inputs;

    }

    //set the input nodes to the input values
    void setInputs(float[] inpts){
        
        layers.get(0).setIn(inpts);
    }

    void setWeights(){


    }

    void generateConnects(float[] weights){
        int x = 0;
        int y = 0;
        neuron in;
        int weightsCounter =0;;
      
        while(x<layers.size()){//loop through all layers
            //while(y<(layers.get(x).neurons.length * layers.get(x+1).neurons.length)){//loop throught the number of connections in the layer
            if(!layers.get(x).isOutput){
               
                for(int i = 0; i<layers.get(x).neurons.length; i++){//loop through the input neurons of the layer
                    in = layers.get(x).neurons[i];
                    for(int ii = 0; ii<layers.get(x+1).neurons.length; ii++){//loop through the ouptut neurons of the layer
                        
                        
                        
                        layers.get(x).connections.add(new connection(weights[weightsCounter],  in,  layers.get(x+1).neurons[ii]));
                        weightsCounter++;//increment the weights


                    }


                }




                y++;
            }
            y=0;

            x++;
        }
    }

    ArrayList<Float> think(float[] weights, float[] inputs){//TODO the inputs need to be normalized
        setInputs(inputs);
        ArrayList<Float> out = new ArrayList<Float>();
        
        for(int i=0;i<layers.size();i++){

            generateConnects(weights);
            
            layers.get(i).runNN();
            
            
            if(layers.get(i).isOutput){
                for(int ii = 0;ii<layers.get(i).neurons.length;ii++){
                    
                    out.add(layers.get(i).neurons[ii].value);

                }
            }
        }
        
        return out;
        

        
    }

    


}
