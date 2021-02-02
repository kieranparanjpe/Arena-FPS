
import java.awt.*;

ArrayList<Object> objects = new ArrayList<Object>();
Button menu;
Button pause;
Button gameOver;

PImage map;
PImage wood;
PImage stone;
PImage face;
PImage white;
int gridSize = 300;

final color ignore = #FFFFFF;
final color stoneColor = #808080;
final color woodColor = #b5651d;

PGraphics world;
PGraphics UI;

public float aangle;

public Mode mode;

float powerUpTime;

public void setup()
{
  world = createGraphics(width, height, P3D);
  UI = createGraphics(width, height, P2D);

  size(displayWidth, displayHeight, P2D);
  map = loadImage("map.png");
  wood = loadImage("oak.png");
  stone = loadImage("stone.png");
  face = loadImage("face.jpg");
  white = loadImage("white.jpg");
  
  rectMode(CENTER);
  textAlign(CENTER);
  
  mode = Mode.MENU;
  menu = new Button(new PVector(width / 2, height / 2), new PVector(500, 200), 255, 200, "Play", Mode.GAME);
  pause = new Button(new PVector(width / 2, height / 2), new PVector(500, 200), 255, 200, "Resume", Mode.GAME);
  gameOver = new Button(new PVector(width / 2, height / 2), new PVector(500, 200), 255, 200, "Replay", Mode.MENU);
  
  CreateScene();
}

public void Reset()
{
  objects = new ArrayList<Object>();
  
  objects.add(new Camera());  
  CreateScene();
}

public void draw()
{
  if(mode == Mode.MENU)
  {
    Menu(); 
  }
  if(mode == Mode.GAME)
  {
    Game(); 
  }
  if(mode == Mode.PAUSE)
  {
    Pause(); 
  }
  if(mode == Mode.GAMEOVER)
  {
    GameOver(); 
  }
  
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
           objects.add(new TexturedCube(wood, new Transform(new PVector(x * gridSize - 2000 + 150, height, y * gridSize - 2000 + 150), new PVector(), 
           new PVector(gridSize, gridSize, gridSize))));
           //objects.add(new TexturedCube(wood, new Transform(new PVector(x * gridSize - 2000 + 150, height - (5 * gridSize), y * gridSize - 2000 + 150), 
           //new PVector(), new PVector(gridSize, gridSize, gridSize))));
           break;
         case(woodColor):
           for(int i = 1; i < 5; i++)
           {
             objects.add(new TexturedCube(wood, new Transform(new PVector(x * gridSize - 2000 + 150, height - (i * gridSize), y * gridSize - 2000 + 150), 
             new PVector(), new PVector(gridSize, gridSize, gridSize))));
           }
           break;
         case(stoneColor):
           for(int i = 1; i < 5; i++)
           {
             objects.add(new TexturedCube(stone, new Transform(new PVector(x * gridSize - 2000 + 150, height - (i * gridSize), y * gridSize - 2000 + 150), 
             new PVector(), new PVector(gridSize, gridSize, gridSize))));
           }
           break;
         default:
           objects.add(new Cube(c, new Transform(new PVector(x * gridSize - 2000 + 150, height / 2, y * gridSize - 2000 + 150), new PVector(), 
           new PVector(gridSize, height, gridSize))));
           //println("box");
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

public enum Mode
{
  MENU,
  GAME,
  PAUSE,
  GAMEOVER
}
