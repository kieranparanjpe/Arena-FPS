
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
  world.background(173, 216, 230); 
  
  
  if(p)
    mode = Mode.PAUSE;
  
  for(int i = 0; i < objects.size(); i++)
  {
     objects.get(i).Draw(); 
    
  }
  
  if(frameCount % 60 == 0)
  {
    objects.add(new Enemy(new PImage[]{white, white, face, white, white, white}, 
    new Transform(new PVector(random(-1000, 9000), height, random(-1000, 9000))), objects.get(0).transform.position));
  }
  if(frameCount % 500 == 0)
  {
    objects.add(new PowerUp(color(0, 0, 255)));
  }
  if(frameCount % 2 == 0)
  {
      objects.add(new Rain());
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
  fill(255);
  textSize(200);
  text("Paused", width / 2, 300);
  pause.Draw();
}

public void GameOver()
{
  background(0); 
  fill(255);
  textSize(200);
  text("Game Over", width / 2, 300);
  gameOver.Draw();
}
