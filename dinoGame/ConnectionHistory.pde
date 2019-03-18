class ConnectionHistory{
  int fromNode;
  int toNode;
  int innovationNumber;
  
  ArrayList<Integer> innovationNumbers = new ArrayList<Integer>();
  
  ConnectionHistory(int fromNode, int toNode, int innovationNumber, ArrayList<Integer> innovationNumbers){
     this.toNode = toNode;
     this.fromNode = fromNode;
     this.innovationNumber = innovationNumber;
     this.innovationNumbers = (ArrayList)innovationNumbers.clone();
  }
  
  boolean matches(Genome genome, Node from, Node to){
    
    if(genome.genes.size() == innovationNumbers.size()){
      if(from.number == fromNode && to.number == toNode){
        
        for(int i = 0; i < geneome.genes.size(); i++){
          if(!innovationNumbers.contains(genome.genes.get(i).innovaitonNo))
            return false;
        }
        return true;
      }
    }
    return true;
  }
  
}
