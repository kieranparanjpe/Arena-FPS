
public abstract class Object
{
  public Transform transform;
  
  public Object(Transform t)
  {
    transform = t;
  }
  
  public Object()
  {
    transform = new Transform(new PVector(0, 0, 0));
  }
  
  public void Draw()
  {
    
  }
  
  protected boolean Collide()
  {
    println(objects.size());
    
    PVector velRight = transform.velocity.copy().normalize();
    
    float angle = atan(velRight.z / velRight.x);
    angle += radians(90);
    
    velRight.x = cos(angle);
    velRight.z = sin(angle);
    
  
    PVector posDir = transform.velocity.copy().setMag(transform.scale.z).add(transform.position);
    posDir.add(new PVector(2000, 2000, 2000));
    posDir.div(gridSize);
    
    PVector posDirA = transform.velocity.copy().setMag(transform.scale.z).add(transform.position.copy()).add(velRight.copy().setMag(transform.scale.x / 2));
    posDirA.add(new PVector(2000, 2000, 2000));
    posDirA.div(gridSize);
    
    PVector posDirB = transform.velocity.copy().setMag(transform.scale.z).add(transform.position.copy()).add(velRight.copy().setMag(transform.scale.x / 2).mult(-1));
    posDirB.add(new PVector(2000, 2000, 2000));
    posDirB.div(gridSize);
  
    return map.get((int)posDir.x, (int)posDir.z) != ignore || map.get((int)posDirA.x, (int)posDirA.z) != ignore || map.get((int)posDirB.x, (int)posDirB.z) != ignore;
  }
}
