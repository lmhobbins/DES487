PShape img;

void setup()
{
   size(1000,800);
   img = loadShape("duck.svg");   
}

void draw()
{
  translate(width/2,height/2);
  pushMatrix();
    rotate(radians(45));
    pushMatrix();
      translate(-250,-250);
      strokeWeight(1);
      fill(color(255,210,79));
      rect(0,0,500,500,35);
    popMatrix(); 
    pushMatrix();
      noFill();
      strokeWeight(18);
      scale(0.93);
      translate(-250,-250);
      rect(0,0,500,500,20);
    popMatrix();
  popMatrix();  

  img.enableStyle();
  pushMatrix();
    scale(1.8);
    translate(-60,-80);
    shape(img, 0, 0);
  popMatrix();
}
