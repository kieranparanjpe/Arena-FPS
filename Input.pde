public boolean w, a, s, d, q, click, e;

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
    q = true;
  }
  else if(key == 'E' || key == 'e')
  {
    e = true;
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
    q = false;
  }
  else if(key == 'E' || key == 'e')
  {
    e = false;
  }
}
