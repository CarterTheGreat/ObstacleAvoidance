
boolean playing = true;
int iteration;
int level = 320;

Player player = new Player("player", 180, level, 10, 30);
Bot bot = new Bot();

ArrayList<Object> objects = new ArrayList<Object>();
int objCooldown = 0;

int fps = 1000;
int score = 0;

//---------------------------------------------------------------------------\\

void setup(){
  
  frameRate(fps);
  size(640,640);
  imageMode(CENTER);
  clear();
} 

void draw(){
  
  if(playing){
    
    frameRate(fps);
    clear(); 
    
    
    objectUpdate();
    playerUpdate();
    setScene();
    check(iteration);
    bot.act();
    iteration++;
    
    fill(255,255,255);
    //rect(0, 320, 640, 2);
    //rect(0, 350, 640, 2);
    text("Objects size: "+objects.size(), 200, 90);
    
  }else{
    loose();
  }
}  

//---------------------------------------------------------------------------\\

void restart(){
  
  objects.clear();
  clear();
  playing = true;
  score = 0;
  player.reset();
  
}

void setScene(){
  if(objects.size() > 0){
    for(int i = 0; i < objects.size(); i++){
      objects.get(i).update();
      objects.get(i).draw();
    }
  }
}

void objectUpdate(){
  
  if(objCooldown <= 0){
      int r = int(random(110, 130));
      if(iteration % r == 0){
        int r1 = int(random(0,4));
        if(r1 == 0)
          objects.add( new Object("gt", 640, 320, 10, 30) );
        if(r1 == 1)
          objects.add( new Object("gs", 640, 335, 10, 15) );
        if(r1 == 2)
          objects.add( new Object("al", 640, 315, 10, 10) );
        if(r1 == 3)
          objects.add( new Object("ah", 640, 310, 10, 10) );
        
        objCooldown = 110;
      }
    }
    objCooldown--;
}

void playerUpdate(){
  
  player.checkMove();
  player.draw();
}

void check(int iter){
  
  if(objects.size() > 0){
    for(int i = 0; i < objects.size(); i++){
    
      if(objects.get(i).x < 0)
        //objects.remove(i);
      
      if (player.x < objects.get(i).x + objects.get(i).w && player.x + player.w > objects.get(i).x &&
          player.y + player.h > objects.get(i).y && player.y < objects.get(i).y + objects.get(i).h){
          
            text("P x: "+player.x +" P y: "+player.y, 200, 50);
            text("O x: "+objects.get(i).x +" O y: "+objects.get(i).y, 200, 70);
            
        playing = false;
      }
    }
  }
  
  if(iter % 250 == 0){
    fps += 4;
  }
  if(iter % 50 == 0)
      score++;
    text("Score: "+ score, 450, 200);
}

void type(String string){
  fill(0, 0, 0);
  text(string, 300,200);
    
}

void loose(){
  text("You loose, nerd", 320, 200);
  bot.loss();
}
