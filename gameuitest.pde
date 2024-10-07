import processing.sound.*;
import processing.javafx.*;
import java.util.ArrayList;

public float xShift;
public float yShift;

public float scrollValue;
public float scrollAcc;

public JSONObject save;
public JSONObject acSave;
public XML ac;
public XML acList[];

public int achievementCount;
public ArrayList<String> achievementList;

public int unclickedTime = 1199;

public SoundFile sfx1;
public SoundFile menu;
public SoundFile clksfx;

public float gtest;
public graphThing gr;

public PFont mainFont;
public PFont mainFontBold;

public scoreBoard sc;
public idleAlert al;

public achievements acStack[];

void setup()
{
  size(800, 450, FX2D);
  frameRate(120);
  pixelDensity(2);
  
  achievementList = new ArrayList<String>();
  
  ac = loadXML("acList.xml");
  achievementCount = ac.getInt("count");
  System.out.println(achievementCount);
  
  acList = ac.getChildren("list");
  
  for(int i = 0; i < achievementCount; i++)
  {
    achievementList.add(acList[i].getContent());
  }
  
  mainFont = loadFont("mainFont.vlw");
  mainFontBold = loadFont("mainFontBold.vlw");
  
  save = loadJSONObject("save.json");
  
  acSave = save.getJSONObject("achievements");
  
  sfx1 = new SoundFile(this, "sfx1.wav");
  menu = new SoundFile(this, "menutheme_f.wav");
  clksfx = new SoundFile(this, "clicksfx.wav");
  
  save.setInt("buffer", save.getInt("buffer") + 1);
  
  
  saveJSONObject(save, "save.json");
  
  sc = new scoreBoard();
  gr = new graphThing();
  al = new idleAlert();
  
  acStack = new achievements[4];
  
  acStack[0] = new achievements();
  
}

void draw()
{
  xShift = (mouseX - (float)width / 2);
  yShift = (mouseY - (float)height / 2);
  unclickedTime += 1;
  
  fill(240, 249, 255);
  rect(-1, -1, width + 2, height + 2);
  
  sc.showComp();
  gtest = sc.getSize();
  gr.composition(gtest);
  
  
  if(unclickedTime >= 1200)
  {
    if(unclickedTime == 1200)
    {
      al.addi();
    }
    al.showComp();
  }
  
  acStack[0].check();
  
  fill(49, 164, 255);
  
  /*
  
  textSize(200);
  textAlign(RIGHT, BOTTOM);
  
  text((int)frameRate, 800, 450);
  */
  
  textSize(10);
  textAlign(CENTER, CENTER);
  text("스크롤해서 텍스트 움직이기\nScroll to move this text", width / 2 + xShift / 50, height / 2 + yShift / 50 + 200 + scrollValue);
  
}

void mouseClicked()
{
  System.out.println("msClk");
  sc.addi();
  clksfx.play();
  unclickedTime = 0;
}

void keyPressed()
{
  if(key == ESC) key = 0;
  else if(key == ' ' || key == ENTER)
  {
    System.out.println("spClk");
    sc.addi();
    clksfx.play();
    unclickedTime = 0;
  }
}

void mouseWheel(MouseEvent event)
{
   scrollValue -= event.getCount();
   scrollAcc = -1 * event.getCount();
}
