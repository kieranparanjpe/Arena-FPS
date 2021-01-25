
import java.awt.*;

//Camera camera = new Camera();

ArrayList<Object> objects = new ArrayList<Object>();

PImage map;
PImage wood;
PImage stone;
PImage face;
int gridSize = 300;

final color ignore = #FFFFFF;
final color stoneColor = #808080;
final color woodColor = #b5651d;

PGraphics world;
PGraphics UI;

public float aangle;

public void setup()
{
  world = createGraphics(width, height, P3D);
  UI = createGraphics(width, height, P2D);

  size(displayWidth, displayHeight, P2D);
  map = loadImage("map.png");
  wood = loadImage("oak.png");
  stone = loadImage("stone.png");
  face = loadImage("face.jpg");
  
  
  objects.add(new Camera());
  objects.add(new Enemy(new PImage[]{wood, wood, face, wood, wood, wood}, new Transform(objects.get(0).transform.position.copy()), objects.get(0).transform.position));
  
  CreateScene();
}

public void draw()
{
  world.beginDraw();
  world.textureMode(NORMAL);

  world.background(0);

  //camera.Draw();
 
  for(int i = 0; i < objects.size(); i++)
  {
     objects.get(i).Draw(); 
  }
  
  if(frameCount % 60 == 0)
  {
    objects.add(new Enemy(new PImage[]{wood, wood, face, wood, wood, wood}, 
    new Transform(new PVector(random(-1000, 9000), height, random(-1000, 9000))), objects.get(0).transform.position));
  }
  world.endDraw();
  
  image(world, 0, 0);
  
  UI.beginDraw();
  UI.clear();
  CrossHair();
  MiniMap();
  UI.endDraw();
  
  image(UI, 0, 0);
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
   
   public PVector velocity = new PVector();
   public PVector forward = new PVector();
   public PVector right = new PVector();

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
