public boolean w, a, s, d, space, click, p;

void keyPressed()
{
  if(key == 'W' || key == 'w')
  {
    w = true;
  }
  else if(key == 'S' || key == 's')
  {
    s = true;
  }
  else if(key == 'D' || key == 'd')
  {
    d = true;
  }
  else if(key == 'A' || key == 'a')
  {
    a = true;
  }
  else if(key == ' ')
  {
    space = true;
  }
  else if(key == 'P' || key == 'p')
  {
    p = true;
  }
}

void keyReleased()
{
  if(key == 'W' || key == 'w')
  {
    w = false;
  }
  else if(key == 'S' || key == 's')
  {
    s = false;
  }
  else if(key == 'D' || key == 'd')
  {
    d = false;
  }
  else if(key == 'A' || key == 'a')
  {
    a = false;
  }
  else if(key == ' ')
  {
    space = false;
  }
  else if(key == 'P' || key == 'p')
  {
    p = false;
  }
}

void mousePressed()
{
  if(mode == Mode.MENU)
    menu.Clicked();
  if(mode == Mode.PAUSE)
    pause.Clicked();
  if(mode == Mode.GAMEOVER)
    gameOver.Clicked();
  
  click = true;
}

void mouseReleased()
{
  if(mode == Mode.MENU)
    menu.Released();
  if(mode == Mode.PAUSE)
    pause.Released();
  if(mode == Mode.GAMEOVER)
    gameOver.Released();
  
  click = false;
}
