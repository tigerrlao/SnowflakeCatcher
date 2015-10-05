Snowflake[] snow;
void setup()
{
  size(500,500);
  background(113,199,227);
  snow = new Snowflake[100];
  for(int i = 0; i < snow.length; i++)
  {
    snow[i] = new Snowflake();
  }
}
void draw()
{

  for(int i = 0; i < snow.length; i++)
  {
    snow[i].lookDown();
    snow[i].erase();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
    snow[i].refresh();
  }
}
void mouseDragged()
{
  rectMode(CENTER);
  if(mouseButton == LEFT)
  {
  fill(0,0,255);
  rect(mouseX,mouseY, 10,10);
  }
  else if(mouseButton == RIGHT)
  {
    fill(113,199,227);
    ellipse(mouseX,mouseY,20,20);
  }
}

class Snowflake
{
  int x,y;
  color myScreen;
  boolean isMoving;
  Snowflake()
  {
    myScreen = color(113,199,227);
    x = (int)(Math.random()*490)+5;
    y = (int)(Math.random()*500)-500;
    isMoving = true;
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(x,y,5,5);
  }
  void lookDown()
  {
    if(y >= 20 && y <= 500 && get(x,y+4) != myScreen)
    {
      isMoving = false;
    }
    else isMoving = true;
  }
  void erase()
  {
    noStroke();
    fill(113,199,227);
    ellipse(x,y,8,8);
  }
  void move()
  {
    if(isMoving == true)
      y = y + 1;
  }
  void wrap()
  {
    if(y >= 495)
    {
      y = (int)(Math.random()*500)-500;
      x = (int)(Math.random()*490)+5;
    }
  }
  void refresh()
  {
    if(keyPressed)
    {
      if(key == 'r')
      {
        x = (int)(Math.random()*490)+5;
        y = (int)(Math.random()*500)-500;
        isMoving = true;
        background(113,199,227);
      }
    }
  }
}


