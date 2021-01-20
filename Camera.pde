
public class Camera 
{
  Robot robot;

  float posx;
  float posy;
  float posz;
  
  float camx;
  float camy;
  float camz;
  
  PVector forward;
  PVector right;
  
  float rotx;
  float roty;
  
  public PVector mov = new PVector();
  
  public boolean move = true;
    
  public Camera()
  {
    try{
      robot = new Robot();
    }
    catch(Exception e){}
    
    camx = width / 2;
    camy = height / 2;
    camz = - (width / 2) - 1;
    
    posx = width / 2;
    posy = 400;
    
    forward = new PVector(0, 0, 1);
    right = new PVector(1, 0, 0);
  }
  
  public void Draw()
  {
    Move();
    camera(posx, posy, posz, camx, camy, camz, 0, 1, 0);
  }
  
  private void Move()
  {
    float x = 0;
    float y = 0;
    if(d) 
      x++;
    if(a)
      x--;
    if(w)
      y++;
    if(s)
      y--;
      
    mov = (forward.copy().mult(y));
    mov.add(right.copy().mult(x));
   
    if(move)
    {
      posx += mov.x * 20;
      posz += mov.z * 20;
    }
   
    rotx += ((mouseX - pmouseX) < width / 2 && (mouseX - pmouseX) > -width / 2) ? (mouseX - pmouseX) * 0.01 : 0;
    roty += (mouseY - pmouseY) * 0.01;
   
    if(roty > radians(89))
      roty = radians(89);
     
    if(roty < radians(-89))
        roty = radians(-89);
    
    forward.x = cos(rotx);
    forward.y = tan(roty);
    forward.z = sin(rotx);
   
    
    right.x = cos(rotx + radians(90));
    right.z = sin(rotx + radians(90));
   
    if(mouseX > width - 2) robot.mouseMove(3, mouseY);
    if(mouseX < 2) robot.mouseMove(width-3, mouseY);
    
    camx = posx + (forward.x * 100);
    camy = posy + (forward.y * 100);
    camz = posz + (forward.z * 100);
  }
}
