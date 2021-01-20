
import java.awt.*;

Camera camera = new Camera();

ArrayList<Object> objects = new ArrayList<Object>();

PImage map;
PImage wood;
PImage stone;
int gridSize = 300;

final color ignore = #FFFFFF;
final color stoneColor = #808080;
final color woodColor = #b5651d;

public void setup()
{
  size(displayWidth, displayHeight, P3D);
  map = loadImage("map.png");
  wood = loadImage("oak.png");
  stone = loadImage("stone.png");
    
  textureMode(NORMAL);
  
  objects.add(new Cube(color(255, 0, 0)));
  
  CreateScene();
}

public void draw()
{
  background(0);
  pointLight(255, 255, 255, camera.posx, camera.posy, camera.posz);

  camera.Draw();
 
  for(Object o : objects)
  {
     o.Draw(); 
  }
  
  camera.move = !Collide();
  
}

public boolean Collide()
{
  println(objects.size());
  
  PVector velRight = camera.mov.copy().normalize();
  
  float angle = atan(velRight.z / velRight.x);
  angle += radians(90);
  
  velRight.x = cos(angle);
  velRight.z = sin(angle);
  

  PVector posDir = camera.mov.copy().setMag(300).add(new PVector(camera.posx, camera.posy, camera.posz));
  posDir.add(new PVector(2000, 2000, 2000));
  posDir.div(gridSize);
  
  PVector posDirA = camera.mov.copy().setMag(300).add(new PVector(camera.posx, camera.posy, camera.posz).add(velRight.copy().setMag(120)));
  posDirA.add(new PVector(2000, 2000, 2000));
  posDirA.div(gridSize);
  
  PVector posDirB = camera.mov.copy().setMag(300).add(new PVector(camera.posx, camera.posy, camera.posz).add(velRight.copy().setMag(120).mult(-1)));
  posDirB.add(new PVector(2000, 2000, 2000));
  posDirB.div(gridSize);

  return map.get((int)posDir.x, (int)posDir.z) != ignore || map.get((int)posDirA.x, (int)posDirA.z) != ignore || map.get((int)posDirB.x, (int)posDirB.z) != ignore;
}

public void CreateScene()
{
  for(int x = 0; x < map.width; x++)
  {
     for(int y = 0; y < map.height; y++)
     {
       color c = map.get(x, y);
       switch(c)
       {
         case(ignore):
           objects.add(new TexturedCube(wood, new Transform(new PVector(x * gridSize - 2000, height, y * gridSize - 2000), new PVector(), new PVector(gridSize, gridSize, gridSize))));
           objects.add(new TexturedCube(wood, new Transform(new PVector(x * gridSize - 2000, height - (5 * gridSize), y * gridSize - 2000), new PVector(), new PVector(gridSize, gridSize, gridSize))));
           break;
         case(woodColor):
           for(int i = 1; i < 5; i++)
           {
             objects.add(new TexturedCube(wood, new Transform(new PVector(x * gridSize - 2000, height - (i * gridSize), y * gridSize - 2000), new PVector(), new PVector(gridSize, gridSize, gridSize))));
           }
           break;
         case(stoneColor):
           for(int i = 1; i < 5; i++)
           {
             objects.add(new TexturedCube(stone, new Transform(new PVector(x * gridSize - 2000, height - (i * gridSize), y * gridSize - 2000), new PVector(), new PVector(gridSize, gridSize, gridSize))));
           }
           break;
         default:
           objects.add(new Cube(c, new Transform(new PVector(x * gridSize - 2000, height / 2, y * gridSize - 2000), new PVector(), new PVector(gridSize, height, gridSize))));
           println("box");
           break;
       }
     }
  }
  
  
}

public class Transform
{
   public PVector position = new PVector();
   public PVector rotation = new PVector();
   public PVector scale = new PVector(100, 100, 100);
   
   public Transform(PVector pos, PVector rot, PVector scl)
   {
     position = pos;
     rotation = rot;
     scale = scl;
   }
   
   public Transform(PVector pos)
   {
     position = pos;
   }
}
