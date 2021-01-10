int slice = noc/2; //current slice

void view2D() 
{
  background(255);
  stroke(0);
  
  getGraphics().hint(PConstants.DISABLE_DEPTH_TEST);
  camera();
  
  for(int i = 0; i < noc; i++)
  {
    for(int j = 0; j < noc; j++)
    {
      if(!type[i][j][slice]) // Draw
        fill(255, Pnew[i][j][slice],0,Pnew[i][j][slice]);
      else
        fill(0,255,0);
      rect (j*width*0.8/noc, i*height*0.8/noc, width*0.8/noc, height*0.8/noc);
      if(mouseX > j*width*0.8/noc && mouseX < ((j*width*0.8/noc) + (width*0.8/noc))) // MOUSE HOVER
      {
        if(mouseY > i*height*0.8/noc && mouseY < ((i*height*0.8/noc) + (height*0.8/noc)))
        {
          fill(0);
          text("Pressure: " + Pnew[i][j][slice], width*0.8 + 10, 8 * textAscent());
          if(mousePressed)
          {
            if (mouseButton == LEFT) {
              Pnew[i][j][slice] += 10000;
            }
            if (mouseButton == RIGHT) {
              if(keyPressed && key == 'c')
                type[i][j][slice] = false;
              else
                type[i][j][slice] = true;
            }
          }
        }
      }
    }
  }
  fill(0); // Text
  text(frameRate , 10, 10 + textAscent());
  text("Right Click on a square to Place a Block", 10, height-4*textAscent());
  text("Left Click on a square to Add pressure", 10, height-6*textAscent());
  text("Press C and Right click to delete a block", 10, height-8*textAscent());
  text("2d View To switch to 3D view hit the Enter Key", 10, height-textAscent());
  text("Use the +/- keys to switch between layers", 10, height-2*textAscent());
  text("Layer: " + int(slice), width*0.8 + 10, 2 * textAscent());
  text("Frame: " + int(frame), width*0.8 + 10, 4 * textAscent());
  fill(255,0,0);
  if(!m_isRunning)
    text("Paused", width*0.8 + 10, 6 * textAscent());
  getGraphics().hint(PConstants.ENABLE_DEPTH_TEST);
}
