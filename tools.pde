float spreadRate = 0.12; // Spread Rate

void setPrevWorld()
{
  for(int i = 0; i < noc; i++)
  {
    for(int j = 0; j < noc; j++)
    {
      for(int k = 0; k < noc; k++)
      {
        Pold[i][j][k] =  Pnew[i][j][k];
      }
    }
  }
}

void pause() // Pause Function
{
  m_isRunning = !m_isRunning;
}

void spread(int x, int y, int z) // Spread Calculation
{
  int locPressure = Pold[x][y][z];
  int[] lossPressure = { // List of Spread With Calculations
    int((locPressure - Pold [(x+1)%noc]     [y]             [z])             * spreadRate),
    int((locPressure - Pold [x]             [y]             [(z+1)%noc])     * spreadRate),
    int((locPressure - Pold [x]             [y]             [(z+noc-1)%noc]) * spreadRate),
    int((locPressure - Pold [(x+noc-1)%noc] [y]             [z])             * spreadRate),
    int((locPressure - Pold [x]             [(y+1)%noc]     [z])             * spreadRate),
    int((locPressure - Pold [x]             [(y+noc-1)%noc] [z])             * spreadRate)
  };
  
  Pnew [(x+1)%noc]     [y]             [z]              += lossPressure[0];
  Pnew [x]             [y]             [(z+1)%noc]      += lossPressure[1];
  Pnew [x]             [y]             [(z+noc-1)%noc]  += lossPressure[2];
  Pnew [(x+noc-1)%noc] [y]             [z]              += lossPressure[3];
  Pnew [x]             [(y+1)%noc]     [z]              += lossPressure[4];
  Pnew [x]             [(y+noc-1)%noc] [z]              += lossPressure[5];
  
  for(int i = 0; i < lossPressure.length; i++) // Lose the Pressure Sent to Adjacent Cubes
  {
    Pold[x][y][z] -= lossPressure[i];
  }
  
}


void setBoard()
  {
  for(int i = 0; i < noc; i++)
  {
    for(int j = 0; j < noc; j++)
    {
      for(int k = 0; k < noc; k++)
      {
        type[i][j][k] = false;
      }
    }
  } 
}
