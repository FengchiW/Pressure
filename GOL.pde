/* 
3d Pressure Simulator
by Wilson Wang
*/
int noc = 25;

int[][][] Pnew = new int[noc][noc][noc]; // Pressure before Iteration
int[][][] Pold = new int[noc][noc][noc]; // Pressure after Iteration
boolean[][][] type = new boolean[noc][noc][noc]; // Cell Type (true| Soild; False| Air)
boolean m_isRunning = false; // Paused
boolean CameraLock = true; // Is Camera Locked
boolean isview2d = true; // Is simulation in 2d view

// Frame Number
int frame = 1;


//Settings
void settings()
{
  size(600,600, P3D);
}

void setup()
{
  frameRate(60); 
  lockCam(3); // set starting 3d view to pos 3
}

void draw()
{
  if (m_isRunning == true) // if the game is not paused
  {
    frame++;
    if(frame % 15 == 0) // update only every 15 frames
    {
      update();
      frame = 0;
    }
  }
  if(isview2d) { // is the view is 2d
    view2D();
  } else { // run 3d view code
    render();
    setCamera();
    updateCamera();
    moveCamera(); 
  }
  
}

void calculateNextGeneration() // Calculate the Next Generation
{
  for(int i = 0; i < noc; i++)
  {
    for(int j = 0; j < noc; j++)
    {
      for(int k = 0; k < noc; k++)
      {
        if(type[i][j][k] == false) // if it is air
          spread(i,j,k); // Spread the Pressure of that Cube to those around it
        if(Pnew[i][j][k] > 0) // if the Pressure is grater that 0
        {
          if(int(random(0,2)) == 1) // 50% chance of radiating a bit of pressure away
            Pnew[i][j][k] -= 1;
        }
        if(Pnew[i][j][k] < 0) // if the pressure is less than 0
        {
          Pnew[i][j][k] = 0; // set the pressure back to 0
        }
      }
    }
  }
}

void update()
{
  setPrevWorld(); // set the previous world
  calculateNextGeneration(); // Run the Calculations
}

void render() // The Drawing part for 3d View
{
  background(0,0,80);
  noStroke();
  
  for(int i = 0; i < noc; i++)
  {
    translate(30,-30*noc,0); // move next block down vertically
    for(int j = 0; j < noc; j++)
    {
      translate(0,30,-30*noc); // move next block left horisontally
      for(int k = 0; k < noc; k++)
      {
        translate(0,0,30); // move next block back
        //air block
        if(type[i][j][k] == false)
        {
          if(Pnew[i][j][k] > 0)
          {
            fill(255, Pnew[i][j][k],0,Pnew[i][j][k]); // adds transparency base on the pressure
            pushMatrix();
            box(28);
            popMatrix();
          }
        } else { // Solid block
          fill(0, 255,0);
          pushMatrix();
          box(28);
          popMatrix();
        }
      }
    }
  }
}
