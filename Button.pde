public class Button
{
  private PVector position;
  private PVector scale;
  
  private color colour;
  private color normalColour;
  private color clickedColour;

  private String text;
  
  private Mode target;
  
  public Button(PVector position, PVector scale, color normalColour, color clickedColour, String text, Mode target)
  {
    this.position = position;
    this.scale = scale;
    
    this.normalColour = normalColour;
    this.clickedColour = clickedColour;
    
    colour = normalColour;

    this.target = target;
    
    this.text = text;
  }
  
  public void Draw()
  {
    if(PointInRect(new PVector(mouseX, mouseY), position, scale))
    {
      stroke(0, 0, 255);
      strokeWeight(5);
    }
    else
    {
      stroke(0);
      strokeWeight(0);
    }
    
    fill(colour);
    rect(position.x, position.y, scale.x, scale.y);
    fill(0);
    textSize(50);
    text(text, position.x, position.y);
  }

  public void Clicked()
  {
    if(PointInRect(new PVector(mouseX, mouseY), position, scale))
    {
      colour = clickedColour;
    }
  }
  
  public void Released()
  {
    colour = normalColour;
    
    if(PointInRect(new PVector(mouseX, mouseY), position, scale))
    {
      mode = target;
    }
  }
  
  public Boolean PointInRect(PVector point, PVector rectPosition, PVector rectScale)
  {
    return((point.x < rectPosition.x + rectScale.x / 2) && (point.x > rectPosition.x - rectScale.x / 2) && 
    (point.y < rectPosition.y + rectScale.y / 2) && (point.y > rectPosition.y - rectScale.y / 2));
   
  }
}
