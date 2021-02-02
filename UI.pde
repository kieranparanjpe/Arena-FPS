
private void CrossHair()
{
  UI.stroke(255);
  UI.strokeWeight(5);
  UI.line(width / 2 - 20, height / 2, width / 2 + 20, height / 2);
  UI.line(width / 2, height / 2 + 20, width / 2, height / 2 - 20);

}

private void MiniMap()
{
  UI.image(map, 50, 50, 160, 160);
  
  if(objects.size() <= 0)
    return;
  
  int x = (int)(objects.get(0).transform.position.x + 2000) / gridSize; 
  int y = (int)(objects.get(0).transform.position.z + 2000) / gridSize; 

  UI.textSize(20);
  UI.fill(255);
  UI.text("X " + x, 50, 250);
  UI.text("Z " + y, 50, 280);
  
  //UI.text("X " + objects.get(0).transform.position.x, 50, 250);
  //UI.text("Z " + objects.get(0).transform.position.z, 50, 280);
  
  UI.noStroke();
  UI.fill(0, 0, 255);
  
  UI.rect(x * 4 + 50, y * 4 + 50, 4, 4);
}
