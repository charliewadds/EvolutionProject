class neuron{
    int layer;
    float value = 0;
    connection[] connections;
    neuron(int layer){
      this.layer = layer;


    }

    void go(){
        if(layer !=0){
            value = tanh(value);//only use activation function on non imput layers
        }

    }

    float tanh(float x) {
    float y = (float)Math.tanh(2*x);
    return y;
  }





}
