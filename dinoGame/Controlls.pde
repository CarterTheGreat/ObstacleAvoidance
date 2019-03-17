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
  
  if(keyCode == RIGHT){
    dinoGame.paused = !dinoGame.paused;
  }
  
  if(keyCode == LEFT){
    dinoGame.botPlaying = !dinoGame.botPlaying;
  }
}
