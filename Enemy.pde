
public class Enemy extends TexturedCube
{
  private PVector target;
  
  boolean start;
  
  public Enemy(PImage[] ts, Transform t, PVector target)
  {
    super(ts, t);
    
    this.target = target;
    transform.scale = new PVector(400, 400, 400);
    transform.position.y = height;
  }
  
  @Override
  public void Draw()
  {
    super.Draw();
     
    if(start)
    {
      transform.forward = transform.position.copy().sub(target);
      world.stroke(255);
      transform.forward.setMag(1);
      world.line(transform.position.x, transform.position.y, transform.position.z,
      transform.position.x + transform.forward.x, transform.position.y + transform.forward.y, transform.position.z + transform.forward.z);
  
      float angle = new PVector(transform.forward.x, -transform.forward.z, 0).heading();
      aangle = angle;
       
      transform.rotation.y = (angle);
      transform.velocity.add(transform.forward.copy().setMag(-1));    
      transform.velocity.y = 0;
      
      if(!Collide())
        transform.position.add(transform.velocity);
      else
        transform.velocity = new PVector();
      
      PVector noy = target.copy();
      noy.y = transform.position.y;
      if(PVector.dist(transform.position, noy) < 250)
      {
        println("DIE");
        objects = new ArrayList<Object>();
        CreateScene();
        mode = Mode.GAMEOVER;
      }
      
      for(Object o : objects)
      {
         if(o.getClass() == Snowball.class)
         {
            if(PVector.dist(transform.position, o.transform.position) < 300)
            {
               ((Snowball)o).Die();
               objects.remove(this);
               return;
            }
         }
      }
    }
    else
    {
      if(transform.position.y <= height / 2)
        start = true;
        else
        {
          transform.position.y-=4;
        }
    }
  }
}
