class Object{
  
  String type;
  int x, y, w, h;
  
  public Object(String type, int x, int y, int w, int h){
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
  
}
