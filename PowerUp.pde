
public class PowerUp extends Cube
{  
  Camera c;
  
  public PowerUp(color c)
  {
    super(c);
    
    transform.position = new PVector(random(-1000, 6000), height / 2, random(-1000, 6000));
    
    transform.rotation = new PVector(PI / 4, 0, 0);
  }
  
  @Override
  public void Draw()
  {
     super.Draw();
     c = (Camera)objects.get(0);

     transform.rotation.y += radians(5);
     
     transform.position.y = (sin(powerUpTime) * 50) + 400;
     
     if(PVector.dist(transform.position, objects.get(0).transform.position) < 300)
     {
        c.fireRate = 100;
        c.lastPowerUp = millis();
        objects.remove(this);

     }

  }
}
