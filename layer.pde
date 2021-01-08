//lists of connetions an neurons for a given layer
class layer{
    int layer;
    boolean isOutput = false; 
    neuron[] neurons;//TODO everything is going to need to switch to array list when i implement variable structure
    ArrayList<connection> connections = new ArrayList<connection>();//these are outgoing connections if there are none it is the output layer
    layer(int size, int layer){//TODO generate connections to all
        
        this.neurons = new neuron[size];
        
        this.layer = layer;
        for(int i = 0; i<size; i++){
           neurons[i] = new neuron(layer); 
        }

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
    void generateConnects(float[] weights){
        println("hello from layer.generateConnects()  ");
        connection curr;
        int x = 0;
        int y = 0;
        int weightsCounter = 0; //<>//
        neuron in;
        neuron out;
        if(!isOutput){
            println("hello from layer.generateConnects() after isOutput ");
            println(layer);
            while(x<layers.get(layer).neurons.length){//while x is less than the number of neurons in the layer
                println("hello from layer.generateConnects() before in  ");
                in = layers.get(layer).neurons[x]; 
                println("hello from layer.generateConnects() after in  ");
                while(y<layers.get(layer+1).neurons.length){
                    out = layers.get(layer+1).neurons[y];
                    println("hello from layer.generateConnects() after out  ");
                    connections.add(new connection(weights[weightsCounter],in, out));
                    weightsCounter++;
                     y++;
                    println("hello from layer.generateConnects() after add  ");
                    print("x is: ");
                    println(x);
                    print("y is: ");
                    println(y);
                    
                   
                }
                y=0;
                x++;
                }

                
            }

            println("hello from layer.generateConnects() after everything  ");
            //TODO put setWeights here
        }
    
    void runNN(){
        //ArrayList<Float> out = new ArrayList<Float>();
        println("hello from layer.runNN ");
        connection curr;
        if(!isOutput){
            for(int i=0;i<connections.size();i++){
                println("hello from layer.runNN before connections.get");
                curr = connections.get(i);
                println("hello from layer.runNN after connections.get");
                print(curr.weight);
                float currVal = (curr.neuronIn.value)*curr.weight;
                neuron in = curr.neuronIn;
                
                println("hello from layer.runNN before curr");
                curr.neuronOut.value= currVal;
                println("hello from layer.runNN after curr");
                curr.neuronOut.go();


            }
        }
        println("hello from layer.runNN after everything");
        //for(int i =0;i<curr.neurons.length;i++){
        //    out.add(curr.neurons[i].value);

        //}

    }





}
