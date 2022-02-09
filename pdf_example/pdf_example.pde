import processing.pdf.*;

PShape img;

void setup()
{
   size(1000,800,PDF,"example.pdf");
   img = loadShape("duck.svg"); 
   noStroke();
   rect(0,0,width,height);
   stroke(0);
}

void draw()
{
  noFill();
  for(int i=0; i<1000; i++)
  {
    bezier(rx(), ry(), rx(), ry(), rx(), ry(), rx(), ry());
  }
  exit();
}

float rx()
{
  return(random(width));
}

float ry()
{
  return(random(height));
}
