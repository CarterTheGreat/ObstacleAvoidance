class Genome{
  ArrayList<Connection> genes = new ArrayList<Connection>();
  ArrayList<Node> nodes = new ArrayList<Node>();//List of nodes
  int inputs;
  int outputs;
  int layers = 2;
  int nextNode = 0;
  int biasNode;
  
  ArrayList<Node> network =  new ArrayList<Node>();//List of nodes in order used in NN
  
  Genome(int inputs, int outputs){
    this.inputs = inputs;
    this.outputs = outputs;
    
    for(int i = 0; i < inputs; i++){
      nodes.add(new Node(i));
      nodes.get(i).layer = 0;
      nextNode++;
    }
    for(int i = 0; i < ouputs; i++){
      nodes.add(new Node(i + inputs));
      nodes.get(i+inputs).layer = 1;
      nextNode++;
    }
    
    biasNode = nextNode;
    nodes.add(new Node(biasNode));
    nodes.get(biasNode).layer = 0;
    nextNode++;
    
  } 
//------------------------------------------------------------------------------------------------------------------------------  
  Node getNode(int nodeNumber){
    for(int i = 0; i < nodes.size(); i++){
      if(nodes.get(i).number == nodeNumber)
        return nodes.get(i);
    }
    return null;
  }
//------------------------------------------------------------------------------------------------------------------------------  
  void connectNodes(){
    
    for(int i = 0; i < nodes.size(); i++){
      nodes.get(i).outputConnections.clear(); 
    }
    for(int i = 0; i < genes.size(); i++){
      genes.get(i).fromNode.ouputConnecitons.add(genes.get(i)); 
    }
  }
//------------------------------------------------------------------------------------------------------------------------------  
  float feedForward(float[] inputValues){
    
    //set outputs of input nodes
     for(int i = 0; i < inputs; i++){
       nodes.get(i).outputValue = inputValues[i]; 
     }
     nodes.get(biasNode).outputValue = 1;
     
     //engage all
     for(int i = 0; i < network.size();i++){
       network.get(i).engage();
     }
     
     //the outputs are nodes[inputs] to nodes [inputs+outputs-1]
     float[] outs = new float[outputs];
     for (int i = 0; i < outputs; i++) {
       outs[i] = nodes.get(inputs + i).outputValue;
     }
     
     //Reset
     for(int i = 0; i < nodes.size(); i ++){
       nodes.get(i).inputSum = 0; 
     }
     
     return outs;
  }
//------------------------------------------------------------------------------------------------------------------------------  


  
}
