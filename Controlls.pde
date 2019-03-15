void keyPressed() {
  if( (keyCode == ' ' || keyCode == UP) && player.cooldown <= 0){
    player.setJump();
  }
  if(keyCode == DOWN && player.cooldown <= 0){
    player.setDuck();
  }
  
  if(keyCode == TAB){
    restart();
  }
}
