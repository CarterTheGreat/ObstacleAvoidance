class Network{
  
  private Layer layer1;
  //private double[][] input, weights;
  private double[][] output;
  
  
  
  public Network(Layer layer1){
    this.layer1 = layer1;
  }
  
  public void process(double[][] inputs){
    output = NNUtil.apply( NNUtil.matrixMultiply( inputs, layer1.weights ), "fn" );
  }
  
  
  
}
