public class achievements
{
  private String acName;
  private String acDesc;
  
  private float xPos;
  private float yPos;
  private int opacity = 0;
  private int whiteVal = 0;
  
  private int elapsedFrame = 0;
  private int isOnScreen = 0;
  
  public achievements()
  {
    xPos = 490;
    yPos = 355;
    opacity = 255;
  }
  
  public void composition()
  {
    elapsedFrame++;
    
    if(xPos >= 489.8)
    {
      xPos = 490;
    }
    else
    {
      xPos += (490 - xPos) / (float)16;
    }
    
    if(elapsedFrame >= 480)
    {
      if(opacity <= 0)
      {
        opacity = 0;
        acSave.setBoolean("0", true);
        System.out.println("achievements value set to true");
        isOnScreen = 0;
        return;
        
      }
      else
      {
        opacity -= 5;
      }
      
    }
    
    
    
    
    
    fill(229, 245, 255, opacity);
    rect(xPos + xShift / 50, yPos + yShift / 50, 295, 75, 16.3);
    
    fill(0, 140, 255, opacity);
    
    textFont(mainFontBold);
    textSize(26);
    textAlign(LEFT, TOP);
    
    text("도전과제 달성!", xPos + 17 + xShift / 50, yPos + 17 + yShift / 50);
    
    textFont(mainFont);
    textSize(16.8);
    
    text(acName, xPos + 16 + xShift / 50, yPos + 49 + yShift / 50);
    
    fill(255, whiteVal);
    rect(xPos + xShift / 50, yPos + yShift / 50, 295, 75, 16.3);
    whiteVal -= 3;
    
    
  }
  
  public int showComp(String name)
  {
    
    
    if(isOnScreen == 0)
    {
      isOnScreen = 1;
      elapsedFrame = 0;
      opacity = 255;
      whiteVal = 255;
      xPos = 470;
      acName = name;
    }
    
    composition();
    
    
    
    return 0;
  }
  
  public void reset()
  {
    isOnScreen = 0;
  }
  
  public void check()
  {
    if(acSave.getBoolean("0") == false && sc.getScore() >= 20)
    {
      
      showComp(achievementList.get(0));
    }
  }
}
