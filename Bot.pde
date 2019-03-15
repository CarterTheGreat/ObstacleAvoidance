class Bot{
 
  int xDist;
  String objType;
  
  public Bot(){
     
  }
  
  void act(){
    
    getNextObject();
    
    if( xDist < 30 && objType == "al"){
      duck();
    }else if(xDist < 30 && objType == "ah"){
      
    }else if(xDist < 30){
      jump();
    }
    
  }
  
//Senses-----------------------------------------------
  
  void getNextObject(){
    
    int objX = 640;
    int objXLast = 0;
    int objY;
    if(objects.size() > 0){
      for(int i = 0; i < objects.size(); i++){
        objX = objects.get(i).x;
        objY = objects.get(i).y;
        if(objXLast < player.x && objX > player.x){
          objType = objects.get(i).type;
          break;
        }
        objXLast = objX;
      }
    }
    
    xDist = objX - 180;
    
    
    String val = "objX: "+objX+ " objXLast: "+objXLast;
    text(val,300,50);
    text("Dist: "+xDist, 300, 70);
    text("Next type: "+objType, 300, 90);
  }
  
  void loss(){
    
    delay(3000);
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
