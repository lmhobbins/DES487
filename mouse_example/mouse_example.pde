sq[] square = new sq[100];

void setup()
{
  size(1000,1000);
  
  int counter = 0;
  for(int y = 0; y < 1000; y = y + 100)
  {
    for(int x = 0; x < 1000; x = x + 100)
    {
      square[counter] = new sq(x,y);
      counter = counter + 1; 
    }
  }  
 
}

void draw()
{
  for(int i=0; i<100; i=i+1)
  {
    square[i].change();
    square[i].show();
  }
}

void mousePressed()
{
  for(int i=0; i<100; i=i+1)
  {
    square[i].clicked(mouseX,mouseY);
  }
}
