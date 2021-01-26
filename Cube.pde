public class Cube extends Object
{
  protected color colour;
  
  public Cube(color c)
  {
    super();
    colour = c;
  }
  
  public Cube(color c, Transform t)
  {
    super(t);
    colour = c;
  }
  
  @Override
  public void Draw()
  {
    world.pushMatrix();
  
    world.translate(transform.position.x, transform.position.y, transform.position.z);
    world.rotateX(transform.rotation.x);
    world.rotateY(transform.rotation.y);
    world.rotateZ(transform.rotation.z);
    
    world.stroke(8);
    world.fill(colour);
  
    world.box(transform.scale.x, transform.scale.y, transform.scale.z);
    
    world.popMatrix();
  }
  
}

public class TexturedCube extends Object
{
  private PImage[] textures;
  
  public TexturedCube(PImage t)
  {
    super();
    textures = new PImage[] {t, t, t, t, t, t};
  }
  
  public TexturedCube(PImage t, Transform tr)
  {
    super(tr);
    textures = new PImage[] {t, t, t, t, t, t};
  }
  
  public TexturedCube(PImage[] ts, Transform t)
  {
    super(t);
    textures = ts;
  }
  
  public TexturedCube(PImage[] ts)
  {
    super();
    textures = ts;
  }
  
  @Override
  public void Draw()
  {
    world.pushMatrix();
  
  world.translate(transform.position.x, transform.position.y, transform.position.z);
  world.rotateX(transform.rotation.x);
  world.rotateY(transform.rotation.y);
  world.rotateZ(transform.rotation.z);
  
  world.scale(transform.scale.x);
  world.noStroke();
 
  world.beginShape(QUADS);
  //f
  
  world.texture(textures[0]);
  world.vertex(-0.5, -0.5, 0.5, 0, 0);
  world.vertex(0.5, -0.5, 0.5, 1, 0);
  world.vertex(0.5, 0.5, 0.5, 1, 1);
  world.vertex(-0.5, 0.5, 0.5, 0, 1);
   world.endShape();

  //b
    world.beginShape(QUADS);

    world.texture(textures[1]);
  world.vertex(-0.5, -0.5, -0.5, 0, 0);
  world.vertex(0.5, -0.5, -0.5, 1, 0);
  world.vertex(0.5, 0.5, -0.5, 1, 1);
  world.vertex(-0.5, 0.5, -0.5, 0, 1);
    world.endShape();

  //l
    world.beginShape(QUADS);

    world.texture(textures[2]);

  world.vertex(-0.5, -0.5, -0.5, 0, 0);
  world.vertex(-0.5, -0.5, 0.5, 1, 0);
  world.vertex(-0.5, 0.5, 0.5, 1, 1);
  world.vertex(-0.5, 0.5, -0.5, 0, 1);
    world.endShape();

  //r
    world.beginShape(QUADS);

    world.texture(textures[3]);

  world.vertex(0.5, -0.5, -0.5, 0, 0);
  world.vertex(0.5, -0.5, 0.5, 1, 0);
  world.vertex(0.5, 0.5, 0.5, 1, 1);
 world. vertex(0.5, 0.5, -0.5, 0, 1);
    world.endShape();

  //t
    world.beginShape(QUADS);

    world.texture(textures[4]);

  world.vertex(-0.5, -0.5, -0.5, 0, 0);
  world.vertex(0.5, -0.5, -0.5, 1, 0);
  world.vertex(0.5, -0.5, 0.5, 1, 1);
  world.vertex(-0.5, -0.5, 0.5, 0, 1);
    world.endShape();

  //b
    world.beginShape(QUADS);

    world.texture(textures[5]);

  world.vertex(-0.5, 0.5, -0.5, 0, 0);
  world.vertex(0.5, 0.5, -0.5, 1, 0);
  world.vertex(0.5, 0.5, 0.5, 1, 1);
  world.vertex(-0.5, 0.5, 0.5, 0, 1);
  
  world.endShape();
  
  
  world.popMatrix();
  }  
}
