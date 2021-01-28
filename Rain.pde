
public class Rain extends Cube
{
  
  float noise = 0;
   
  public Rain()
  {
   super(color(0, 0, 255, 100), new Transform(new PVector(random(-1000, 9000), -5000, random(-1000, 9000))));
   transform.scale = new PVector(25, 50, 25);
   
   
  }
  
  @Override
  public void Draw()
  {
   super.Draw();
   
   noise += 0.1;
   transform.position.x += (noise(noise) - 0.5) * 25;
   transform.position.z += (noise(noise) - 0.5) * 25;

   transform.velocity.y+= 0.1;
   
   transform.position.y += transform.velocity.y;
   
   if(transform.position.y > height - transform.scale.y - gridSize / 2)
   {
     for(int i = 0; i < 10; i++)
     {
        objects.add(new Particle(colour, new Transform(new PVector(transform.position.x, height - transform.scale.y - gridSize / 2, transform.position.z)))); 
     }
     objects.remove(this);
   }
  }
}
