void keyPressed()
{
  if(keyCode == UP || key == 'w'){
    camUp = true;
  }
  
  if(keyCode == DOWN || key == 's'){
    camDown = true;
  }
  
  if(keyCode == LEFT || key == 'a'){
    camRight = true;
  }
  
  if(keyCode == RIGHT || key == 'd'){
    camLeft = true;
  }
  if(key == ' ' || key == 'q'){
    camFly = true;
  }
  
  if(keyCode == SHIFT || key == 'e'){
    camFall = true;
  }
  
  if(key == '=' || key == '+' ){
    if(slice < noc-1)
      slice += 1;
  }
  if(key == '-' || key == '_' ){
    if(slice > 0)
      slice -= 1;
  }
  
  if(key == 'p'){
    pause();
  }
  
  if(key == 'l'){
    CameraLock = !CameraLock;
  }
  
  if(key == '1'){
    lockCam(1);
  }
  
  if(key == '2'){
    lockCam(2);
  }
  
  if(key == '3'){
    lockCam(3);
  }
  if(key == '4'){
    lockCam(4);
  }
  
  if(keyCode == ENTER){
    isview2d = !isview2d;
  }
}

void keyReleased()
{
  if(keyCode == UP || key == 'w'){
    camUp = false;
  }
  
  if(keyCode == DOWN || key == 's'){
    camDown = false;
  }
  
  if(keyCode == LEFT || key == 'a'){
    camRight = false;
  }
  
  if(keyCode == RIGHT || key == 'd'){
    camLeft = false;
  }
  
  if(key == ' ' || key == 'q'){
    camFly = false;
  }
  
  if(keyCode == SHIFT || key == 'e'){
    camFall = false;
  }
  
}
