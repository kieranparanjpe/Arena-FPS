public class Cube extends Object
{
  private color colour;
  
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
    pushMatrix();
  
    translate(transform.position.x, transform.position.y, transform.position.z);
    rotateX(transform.rotation.x);
    rotateY(transform.rotation.y);
    rotateZ(transform.rotation.z);
    
    stroke(8);
    fill(colour);
  
    box(transform.scale.x, transform.scale.y, transform.scale.z);
    
    popMatrix();
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
      pushMatrix();
  
  translate(transform.position.x, transform.position.y, transform.position.z);
  rotateX(transform.rotation.x);
  rotateY(transform.rotation.y);
  rotateZ(transform.rotation.z);
  
  scale(transform.scale.x);
  noStroke();
 
  beginShape(QUADS);
  //f
  
  texture(textures[0]);
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
    endShape();

  //b
    beginShape(QUADS);

    texture(textures[1]);
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
    endShape();

  //l
    beginShape(QUADS);

    texture(textures[2]);

  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
    endShape();

  //r
    beginShape(QUADS);

    texture(textures[3]);

  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
    endShape();

  //t
    beginShape(QUADS);

    texture(textures[4]);

  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
    endShape();

  //b
    beginShape(QUADS);

    texture(textures[5]);

  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  endShape();
  
  
  popMatrix();
  }  
}
