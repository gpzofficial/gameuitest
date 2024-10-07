public class graphThing
{
  
  public float yg[];
  
  public graphThing()
  {
    yg = new float[160];
    for(int i = 0; i < 160; i++)
    {
      yg[i] = 40;
    }
  }
  
  public void composition(float lastFrame)
  {
    for(int i = 0; i < 160; i++)
    {
      if(i != 0)
      {
        yg[i - 1] = yg[i];
      }
    }
    yg[159] = lastFrame;
    
    stroke(255, 0);
    fill(49, 164, 255);
    
    for(int i = 0; i < 160; i++)
    {
      circle(width / 2 - 80 + i + (mouseX - (float)width / 2) / (float)10, height / 2 + 20 - yg[i] + (mouseY - (float)height / 2) / (float)10, 3);
    }
    
  }
  
  public void showComp()
  {
    
  }
}
