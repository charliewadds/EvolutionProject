//lists of connetions an neurons for a given layer
class layer{
    int layer;
    boolean isOutput = false; 
    neuron[] neurons;//TODO everything is going to need to switch to array list when i implement variable structure
    ArrayList<connection> connections = new ArrayList<connection>();//these are outgoing connections if there are none it is the output layer
    layer(int size, int layer){//TODO generate connections to all
        
        this.neurons = new neuron[size];
        this.layer = layer;


        if(layer+1 == layers.size()){
            isOutput = true;
        }
    }
    //sets the values of all neurons in the layer to a list of floats 
    void setIn(float[] inpts){
        int x = 0;
        while(x<=neurons.length){
            neurons[x].value=inpts[x];
            neurons[x].layer=layer;

            x++;
        }


    }
    void generateConnects(){
        connection curr;
        int x = 0;
        int y = 0;
        neuron in;
        neuron out;
        if(!isOutput){
            while(x<=layers.get(layer).neurons.length){
                in = layers.get(layer).neurons[x];
                
                while(x<=layers.get(x+1).neurons.length){
                    out = layers.get(layer+1).neurons[y];
                    connections.add(new connection(0,in, out));
                    y++;
                }
                y=0;
                x++;
                }

                
            }


            //TODO put setWeights here
        }
    
    void setWeights(){


    }





}
