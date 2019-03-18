class Connection{{
  Node fromNode;
  Node toNode;
  float weight;
  boolean enabled = true;
  int innovationNo;
  
  Connection(Node fromNode, Node toNode, float weight, int innovationNo){
    this.toNode = toNode;
    this.fromNode = fromNode;
    this.weight = weight;
    this.innovationNo = innovationNo;
  }
  
  void mutateWeight(){
    float rand = random(1);
    if(rand < .1){
      weight = random(-1,1); 
    }else{
      weight += randomGaussian()/50;
      if(weight > 1)
        weight = 1;
      if(weight < -1)
         weight = -1;     
    }
  }
  
  Connection clone(Node from, Node to){
    Connection clone = new Connection(from, to, weight, innovationNo);
    clone.enabled = enabled;
    return clone;
  }
  
}
