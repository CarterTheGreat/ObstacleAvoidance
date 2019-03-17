class Ground{
  
  String type;
  int x = dinoGame.xMax; 
  int y = 350;
  int w = 14;
  int h = 4;
  
  public Ground(){
  }
  
  void update(){
    x--;
  }
  
  void draw(){
    int rand = int(random(200,255));
    fill(rand, rand, rand);
    rect(x, y, w, h);
  }
}
