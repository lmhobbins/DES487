PShape img;

void setup()
{
   size(1000,800);
   img = loadShape("duck.svg");    
}

void draw()
{
  rectangle();
  octagon(0,0,420);
  //warn();
  //redcircle();
  
  //ducky(-60,-60,1.8); 
}

void octagon(float x, float y, float radius) 
{
  pushMatrix();
    translate(width/2,height/2);
    rotate(radians(22.5));
    float angle = TWO_PI / 8;
    fill(color(191,49,26));
    stroke(color(255,255,255));
    strokeWeight(radius/30);
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    stroke(0);
    noFill();
    strokeWeight(2);
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * (radius+(radius/60));
      float sy = y + sin(a) * (radius+(radius/60));
      vertex(sx, sy);
    }
    endShape(CLOSE);
  popMatrix();  
}

void redcircle()
{
  pushMatrix();
    translate(width/2,height/2);
    rotate(radians(45));
    stroke(color(191,49,26));
    strokeWeight(60);
    circle(0,0,520);
    line(-260,0,260,0);
  popMatrix();  
}

void rectangle()
{
  stroke(0);
  pushMatrix();
  translate(width/2,height/2);
  scale(1.36);
    pushMatrix();
      translate(-250,-250);
      strokeWeight(1);
      fill(color(255,255,255));
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
}

void warn()
{
  warning(color(255,210,79));
}

void temp_warn()
{
  warning(color(227,133,55));
}

void warning(color bg)
{
 stroke(0); 
 pushMatrix();
   translate(width/2,height/2);
    rotate(radians(45));
    pushMatrix();
      translate(-250,-250);
      strokeWeight(1);
      fill(bg);
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
}

void ducky(float xpos, float ypos, float size)
{
  img.enableStyle();
  pushMatrix();
    scale(size);
    translate(xpos,ypos);
    shape(img, 0, 0);
  popMatrix();
}
