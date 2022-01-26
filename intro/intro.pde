void setup()
{
  size(1000,1000);
}

void draw()
{
  fill(color(255,255,255,10));
  rect(0,0,width,height);
  line(mouseX,mouseY,random(width),random(height));
}
