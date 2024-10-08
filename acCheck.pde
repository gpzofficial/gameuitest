public class acCheck
{
  public acCheck()
  {
  }
  
  public int check(int acIndex)
  {
    switch(acIndex)
    {
      case 0:
        if(acSave.getBoolean("0") == false && sc.getScore() >= 1000)
        {
          return 1;
        }
        break;
      case 1:
        if(acSave.getBoolean("1") == false && sc.getScore() >= 3000)
        {
          return 1;
        }
        break;
      case 2:
        if(acSave.getBoolean("2") == false && sc.getScore() >= 6000)
        {
          return 1;
        }
        break;
      case 3:
        if(acSave.getBoolean("3") == false && sc.getScore() >= 10000)
        {
          return 1;
        }
        break;
      case 4:
        if(acSave.getBoolean("4") == false && unclickedTime >= 7200)
        {
          return 1;
        }
        break;
      case 5:
        if(acSave.getBoolean("5") == false && debugAchievement == 1)
        {
          return 1;
        }
        break;
        
    }
    
    return 0;
    
  }
  
}
