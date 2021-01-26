
public class Snowball extends Cube
{
  public Snowball(color c, Transform t)
  {
    super(c, t);
  }
  
  @Override
  public void Draw()
  {
    super.Draw();
    
    if(!Collide())
    {
      transform.position.add(transform.velocity);
    }
    else
    {
      Die();
    }
      
  }
  
  public void Die()
  {
          for(int i = 0; i < 10; i++)
      {
         objects.add(new Particle(color(255), new Transform(transform.position.copy())));  
      }
      
      objects.remove(this);
  }
}
