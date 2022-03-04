

class circ
{
  float x = random(width);
  float y = random(height);
  float speed = random(4);
  float prev_dir = random(360);
  float dir = random(360);
  int steps = 0;
  
  circ()
  {
  
  }
  
  void show()
  {
    steps = steps + 1;
    if(steps>100)
    {
      prev_dir = dir;
      dir=random(360);
      steps=0;
    }  
    
    float actual_dir = lerp(prev_dir,dir,steps/100.0);
    
    x = x+(sin(radians(actual_dir))*speed);
    y = y+(cos(radians(actual_dir))*speed);
    

    if(x<0) x=width;
    if(x>width) x=0;
    if(y<0) y=height;
    if(y>height) y=0;
    
    fill(color(0,0,0));
    pushMatrix();
      translate(x,y);
      circle(0,0,30);
    popMatrix();
  }

}
