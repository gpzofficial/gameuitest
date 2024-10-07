public class scoreBoard
{
  
  private int score;
  
  private float fSize = 40;
  
  public scoreBoard()
  {
    score = 0;
    sfx1.play();
    menu.loop();
    
    score = save.getInt("score");
    
  }
  
  public int composition()
  {
    
    textFont(mainFont);
    
    if(fSize <= 40.015)
    {
      fSize = 40;
    }
    else
    {
      fSize -= (float)(fSize - 40) / 8;
    }
    
    textSize(30);
    textAlign(LEFT, TOP);
    fill(49, 164, 255);
    text(score + "점", -20 + fSize + (mouseX - (float)width / 2) / (float)50, 20 + (mouseY - (float)height / 2) / (float)50);
    
    
    
    return 0;
  }
  
  public int showComp()
  {
    composition();
    return 0;
  }
  
  public void addi()
  {
    score++;
    fSize = 66;
    save.setInt("score", score);
    saveJSONObject(save, "save.json");
  }
  
  public float getSize()
  {
    return fSize;
  }
  
  public int getScore()
  {
    return score;
  }
  
  
}
