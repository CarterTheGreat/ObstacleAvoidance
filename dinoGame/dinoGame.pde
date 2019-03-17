int yMax = 640;
static int xMax = 640;

static boolean paused = false;
boolean playing = true;
int iteration;
int level = 320;

Player player = new Player("player", 160, level, 10, 30);
Bot bot = new Bot();
static boolean botPlaying = false;

ArrayList<Object> objects = new ArrayList<Object>();
int objCooldown = 0;

ArrayList<Ground> ground = new ArrayList<Ground>();

int fps = 300;
int score = 0;

//---------------------------------------------------------------------------\\

void setup(){
  
  frameRate(fps);
  size(640, 640);
  imageMode(CENTER);
  clear();
} 

void draw(){
  
  if(playing && ! paused){
    
    frameRate(fps);
    clear(); 
    
    groundUpdate();
    objectUpdate();
    
    if(botPlaying){
      bot.act();
      fill(255, 255, 255);
      text("Bot Mode", 580, 20);
    }
    playerUpdate();
    
    check(iteration);
    setScene();
    iteration++;
    
    /*
    fill(255,255,255);
    rect(0, 320, 640, 2);
    rect(0, 350, 640, 2);
    text("Objects size: "+objects.size(), 200, 90);
    */
    
  }
  else if( !playing && !paused){
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
  
  for(int i = 0; i < ground.size(); i++){
    ground.get(i).update();
    ground.get(i).draw();
  }

  
  if(objects.size() > 0){
    for(int i = 0; i < objects.size(); i++){
      objects.get(i).update();
      objects.get(i).draw();
    }
  }
}

void groundUpdate(){
  if( iteration % 10 == 0){
    ground.add(new Ground());
  }
}

void objectUpdate(){
  
  if(objCooldown <= 0){
      int r = int(random(110, 130));
      if(iteration % r == 0){
        int r1 = int(random(0,4));
        if(r1 == 0)
          objects.add( new Object("gt", xMax, 320, 10, 30) );
        if(r1 == 1)
          objects.add( new Object("gs", xMax, 335, 10, 15) );
        if(r1 == 2)
          objects.add( new Object("al", xMax, 315, 10, 10) );
        if(r1 == 3)
          objects.add( new Object("ah", xMax, 309, 10, 10) );
        
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
  
  for(int i = 0; i < ground.size(); i++){
    if(ground.get(i).x < -10)
      ground.remove(i);
  }
  
  for(int i = 0; i < objects.size(); i++){

    if(objects.get(i).x < 0)
      objects.remove(i);
      
    //text("P x: "+player.x +" P y: "+player.y, 120, 50);
    //text("O x: "+objects.get(i).x +" O y: "+objects.get(i).y, 120, 70);
    if(objects.size() > 0){ 
      if( player.x < objects.get(i).x + objects.get(i).w &&
          player.x + player.w > objects.get(i).x &&
          player.y < objects.get(i).y + objects.get(i).h &&
          player.y + player.h > objects.get(i).y ) {   
            
        //paused = true;
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
  if(botPlaying)
    bot.loss();
}
