class Player extends Object{
  
  String type;
  int x, y, w, h;
  int actionTicks;
  int actionTicksMax = 51;
  
  boolean jumping;
  boolean ducking;
  int cooldown;

  public Player(String type, int x, int y, int w, int h){
    super(type, x, y, w, h);
    this.type = type;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void update(){
    x--;
  }
  
  void draw(){
    fill(255, 255, 255);
    rect(x, y, w, h);
  }
  
  void setJump(){
    if(!ducking && !jumping){
      jumping = true;
      cooldown = 55;
    }
  }
  
  void jump(boolean rising){
    
    if(rising){
        player.y -= 3;
      }else{
        player.y += 3;
      }
  }
  
  void setDuck(){
    if(!ducking && !jumping){
      ducking = true;
      cooldown = 55;
    }
  }
  
  void duck(){
    
    player.h = 15;
    player.y += 15;
    ducking = true;
  }
  
  void checkMove(){
      
    if(jumping){
      if(actionTicks < actionTicksMax / 3){
        jump(true);
      }
      else if( actionTicks >= (actionTicksMax*2)/3 ){
        jump(false);
      }
      actionTicks++;  
    }
     
    if(ducking){
      if(actionTicks == 0){
        duck();
      }
      actionTicks++;
    }
      
    if(actionTicks == actionTicksMax){
      ducking = false;
      jumping = false;
    }
    
    if(!jumping && !ducking){
      
      actionTicks = 0;
      cooldown = 0;
      player.y = 320;
      player.h = 30;
      jumping = false;
      ducking = false;
    }  
     
    cooldown--;
  }
  
  void reset(){
    cooldown = 0;
  }
  
}
