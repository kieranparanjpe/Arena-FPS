
public void Menu()
{
  background(0); 
  fill(255);
  textSize(200);
  text("3D Game", width / 2, 300);
  menu.Draw();
}

public void Game()
{
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(0); 
  
  
  if(p)
    mode = Mode.PAUSE;
  
  for(int i = 0; i < objects.size(); i++)
  {
     objects.get(i).Draw(); 
    
  }
  
  if(frameCount % 60 == 0)
  {
    objects.add(new Enemy(new PImage[]{wood, wood, face, wood, wood, wood}, 
    new Transform(new PVector(random(-1000, 9000), height, random(-1000, 9000))), objects.get(0).transform.position));
  }
  if(frameCount % 500 == 0)
  {
    objects.add(new PowerUp(color(0, 0, 255)));
  }
  powerUpTime += 0.1;
  world.endDraw();
  
  image(world, 0, 0);
  
  UI.beginDraw();
  UI.clear();
  CrossHair();
  MiniMap();
  UI.endDraw();
  
  image(UI, 0, 0);
}

public void Pause()
{
  background(0); 
  pause.Draw();
}

public void GameOver()
{
  background(0); 
  gameOver.Draw();
}
