class Senses{
  
  private Object getNextObj(){
   int objX = 640;
   int objXLast = 0;
   if(objects.size() > 0){
     for(int i = 0; i < objects.size(); i++){
       objX = objects.get(i).x;
       if(objXLast <= player.x && objX > player.x){
         return objects.get(i);
       }
       
       objXLast = objX;
     }
   }
   
   return new Object("null", 640, 320, 0,0);
  }
  
  public String getObjType(){
    //fill(255, 255, 255);
    //text("Next: "+getNextObj().type, 50, 30);
    return getNextObj().type;
  }
  
  public int getObjX(){
    return getNextObj().x;
  }
  
  public int getObjY(){
    return getNextObj().y;
  }
  
  public int getObjW(){
    return getNextObj().w;
  }
  
  public int getObjH(){
    return getNextObj().h;
  }
  
  public int getDistance(){
    //fill(255, 255, 255);
    //text("Dist: "+str(getNextObj().x - player.x), 50, 10);
    return getNextObj().x - player.x;
  }
  
}
