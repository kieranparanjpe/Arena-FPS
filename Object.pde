
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
}
