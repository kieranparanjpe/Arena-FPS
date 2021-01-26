import java.util.Random;

public class Particle extends Cube
{
  
  int alpha = 255;
 
  public Particle(color c, Transform t)
  {
     super(c, t); 
     
     Random random = new Random();
     
     transform.velocity = new PVector(random.nextInt(50 + 50) - 50, -5, random.nextInt(50 + 50) - 50);
     transform.scale = new PVector(20, 20, 20);
  }
  
  @Override
  public void Draw()
  {
     super.Draw();
     
     if(!Collide() && transform.position.y < height - transform.scale.y - gridSize / 2)
     {
       transform.position.add(transform.velocity); 
       transform.velocity.y++;
     }
     else
     {
       alpha-=2;
       colour = color(colour = color(red(colour), green(colour), blue(colour), alpha));
       
       if(alpha <= 0)
         objects.remove(this);
     }
  }
}
