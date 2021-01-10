// this file is complicated


// Camera Location
float CamX = 459.33347;
float CamY = -36.666653;
float CamZ = -372.99988;

// Camera View location
float tx = 349.33322;
float ty = -76.66664;
float tz = -271.99988;

// Camera Angle
float angle;

// Camera Deltas
float xComp,zComp,yComp;

//Movement Initialization
int camSpeed = 15;
boolean camUp = false;
boolean camDown = false;
boolean camLeft = false;
boolean camRight = false;
boolean camFly = false;
boolean camFall = false;

void setCamera() // set the camera
{
  camera(CamX, CamY, CamZ, tx, ty, tz, 0, 1, 0);
  ambientLight(255, 255, 255, CamX, CamY, CamZ);
}

void lockCam(int pos) // predefined camera viewpoints
{
  if (pos == 1)
  {
    CamX = 459.33347;
    CamY = -36.666653;
    CamZ = -372.99988;
    tx = 349.33322;
    ty = -76.66664;
    tz = -271.99988;
  }
  if (pos == 2)
  {
    CamX = -590.06555;
    CamY = 103.33334;
    CamZ = -710.5321;
    tx = -472.06555;
    ty = 63.33332;
    tz = -620.5322;
  }
  if (pos == 3)
  {
    CamX = 907.5336;
    CamY = -156.66676;
    CamZ = 110.799355;
    tx = 785.5333;
    ty = -196.6667;
    tz = -6.200346;
  }
  
}

void updateCamera() // update the camera rotation
{
    if (!CameraLock) // as long as the camera is not locked
    {
      int deltaX = mouseX - width/2; // difference of the mouse to the center of the screen
      
      // println("camX: ", CamX, "camY: ", CamY, "camZ: ", CamZ, "TX: ", tx,"TY ", ty,"TZ", tz);
      
      if(abs(deltaX) > 100){ // in the center the view doesn't move
        xComp = tx - CamX;
        zComp = tz - CamZ;
        yComp = ty - CamY;
        
        angle = correctAngle(xComp,zComp); // set the angle
        
        //Looking 'forwards'
        if ((angle >= 0 && angle < 45) || (angle > 315 && angle < 360))
          tx += deltaX/25;
          
        //Looking 'left'
        else if (angle > 45 && angle < 135)
          tz += deltaX/25;
          
        //Looking 'back'
        else if (angle > 135 && angle < 225)
          tx -= deltaX/25;
          
        //Looking 'right'
        else if (angle > 225 && angle < 315)
          tz -= deltaX/25;
      }
    }
}

void moveCamera() // WASD movements
{
    if(camUp){ // move camera Forwards
      CamZ += zComp/camSpeed;
      tz+= zComp/camSpeed;
      CamX += xComp/camSpeed;
      tx+= xComp/camSpeed;
    }
    else if(camDown){ // move camera Backwards
      CamZ -= zComp/camSpeed;
      tz-= zComp/camSpeed;
      CamX -= xComp/camSpeed;
      tx-= xComp/camSpeed;
    }
    if (camLeft){ // move camera Left
      CamZ += xComp/camSpeed; 
      tz+= xComp/camSpeed;
      CamX -= zComp/camSpeed;
      tx-= zComp/camSpeed;
    }
    if (camRight){ // move camera Right
      CamZ -= xComp/camSpeed; 
      tz-= xComp/camSpeed;
      CamX += zComp/camSpeed;
      tx+= zComp/camSpeed;
    } 
    if (camFly){ // move camera vertically up
      CamY += yComp/int(camSpeed*0.80); 
      ty += yComp/int(camSpeed*0.80);
    } 
    if (camFall){ // move camera vertically down
      CamY -= yComp/int(camSpeed*0.80); 
      ty -= yComp/int(camSpeed*0.80);
    } 
}

public float correctAngle(float xc, float zc){
  float newAngle = -degrees(atan(xc/zc));
  if (xComp > 0 && zComp > 0)
    newAngle = (90 + newAngle)+90;
  else if (xComp < 0 && zComp > 0)
    newAngle = newAngle + 180;
  else if (xComp < 0 && zComp < 0)
    newAngle = (90+ newAngle) + 270;
  return newAngle;
}
