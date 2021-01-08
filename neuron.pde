class neuron{
    int layer;
    float value;
    connection[] connections;
    neuron(){


    }

    float go(){
        if(layer !=0){
            return sigmoid(value);//only use activation function on non imput layers
        }else{
            return value;
        }
        

    }

    float tanh(float x) {
    float y = Math.tanh(2*x);
    return y;
  }





}
