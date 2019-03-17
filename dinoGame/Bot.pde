class Bot{
 
  Senses senses = new Senses();
  
  public Bot(){
     
  }
  
  void act(){
    
    if(objects.size() > 0){
      int xDist = senses.getDistance();
      String objType = senses.getObjType();
      
      if( xDist < 30 && objType == "al"){
        duck();
      }else if(xDist < 30 && objType == "ah"){
        
      }else if(xDist < 30){
        jump();
      }
    }
  }
  
//Senses-----------------------------------------------
    
  void loss(){
    
    delay(1000);
    restart();
  }


//Actions--------------------------------------------- 
  void jump(){
    player.setJump();
  }
  
  void duck(){
    player.setDuck();
  }
  
}
