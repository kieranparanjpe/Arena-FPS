
float angle;

public void Menu()
{
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(173, 216, 230);   
  
  angle -= 0.005;
  
  world.camera(cos(angle) * 2500 + 2500, -2500, sin(angle) * 2500 + 2500, 2500, 0, 2500, 0, 1, 0);
  
  for(int i = 0; i < objects.size(); i++)
  {
     objects.get(i).Draw(); 
  }
  
  world.endDraw();
  
  image(world, 0, 0);
  
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
    new Transform(new PVector(random(-1000, 6000), height, random(-1000, 6000))), objects.get(0).transform.position));
  }
  if(frameCount % 500 == 0)
  {
    objects.add(new PowerUp(color(0, 0, 255)));
  }
  if(frameCount % 2 == 0)
  {
      objects.add(new Rain());
  }
  powerUpTime += 0.075;
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
  image(world, 0, 0);
  fill(0, 0, 0, 128);
  strokeWeight(0);
  rect(width / 2, height / 2, displayWidth - 200, displayHeight - 200);
  
  fill(255);
  textSize(200);
  text("Paused", width / 2, 300);
  pause.Draw();
  
}

public void GameOver()
{
  image(world, 0, 0);
  fill(0, 0, 0, 128);
  strokeWeight(0);
  rect(width / 2, height / 2, displayWidth - 200, displayHeight - 200);
  
  fill(255, 0 , 0);
  textSize(200);
  text("Game Over", width / 2, 300);
  gameOver.Draw();
}
