class Node{
 int number;
 float inputSum;
 float outputValue;
 ArrayList<Connection> outputConnections = new ArrayList<Connection>();
 int layer;
 PVector drawPos = new PVector();
 
 Node(int number){
  this.number = number; 
 }
 
 void engage(){
  if(layer != 0)
    outputValue = sigmoid(inputSum);
    
  for(int i  = 0; i < outputConnections.size(); i++){
    if(outputConnections.get(i).enabled){
      outputConnections.get(i).toNode.inputSum +=  outputConnections.get(i).weight * outputValue;
    }
  }
 }
 
 float sigmoid(float x){
   float val = 1 / (1 + pow( (float)Math.E, -4.9*x ));
   return val;
 }
 
 boolean isConnected(Node node){
   if(node.layer == layer)
     return false;
     
   if(node.layer < layer){
     for(int i = 0; i < node.outputConnections.size(); i++){
       if(node.ouputConnections.get(i).toNode == this)
         return true;
     }    
   }else{
     for(int i = 0; i < outputConnections.size(); i++){
       if(ouputConnections.get(i).toNode == node)
         return true;
     }
   }
 }
 
 Node clone(){
   Node clone = new Node(number);
   clone.layer = layer;
   return clone;
 }
}
