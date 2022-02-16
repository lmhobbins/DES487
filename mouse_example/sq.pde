class sq
{
  float px = 0; //vertical position
  float py = 0; //horizontal position
  float w = 100; //width
  float h = 100; //height
  color c = color(0,125,225); //fill color
  
  sq(float xpos, float ypos)
  {
    this.px = xpos;
    this.py = ypos;
  }
  
  void show()
  {
    noStroke();
    fill(this.c);
    rect(this.px,this.py,this.w,this.h);
  }
  
  void change()
  {
    colorMode(HSB,360,100,100);
    float hue = hue(this.c)+random(1);
    float sat = saturation(this.c);
    float val = brightness(this.c);
    
    this.c = color(hue,sat,val);
  }
  
  void clicked(int mx, int my)
  {
    if(mx > this.px && mx < this.px+this.w && my > this.py && my < this.py+this.h)
    {
      colorMode(RGB);
      this.c = color(0,125,225);
    }
  }
}
