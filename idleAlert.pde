public class idleAlert
{
  
  private int score;
  
  private float fSize = 40;
  
  public idleAlert()
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
    
    textSize(10);
    textAlign(CENTER, CENTER);
    fill(49, 164, 255);
    text("화면을 클릭하거나 스페이스 바를 눌러 득점하기\nClick or press Space bar to earn points", width / 2 + (mouseX - (float)width / 2) / (float)50, height / 2 + 10 + (mouseY - (float)height / 2) / (float)50);
    
    save.setInt("score", score);
    
    saveJSONObject(save, "save.json");
    
    return 0;
  }
  
  public int showComp()
  {
    composition();
    return 0;
  }
  
  public void addi()
  {
    fSize = 100;
  }
  
  public float getSize()
  {
    return fSize;
  }
  
  
}
