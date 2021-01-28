
public void GenerateTerrain()
{
  for(int x = 0; x < 30; x++)
  {
    for(int y = 0; y < 30; y++)
    {
      float n = noise(x * 10, y * 10);
     // n *= gridSize;
      PVector pos = new PVector(x * gridSize + 9000, n * gridSize * 5 + height, y * gridSize);
      Transform t = new Transform(pos);
      t.scale = new PVector(gridSize, gridSize, gridSize);
      
      objects.add(new Cube(color(0, 255, 0), t));
    }
  }
}
