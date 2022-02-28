float x=0;
float y=0;
float angle = 0;

void setup() 
{
   size(1000,1000);
   y = height/2;
   x = width/2;
}


void draw()
{
   angle = angle +1;
   background(0);
   circle(x,y,100);
   x =  (sin(radians(angle))*400)+(width/2.0);
   //y =  (cos(radians(angle*4))*100)+(height/2.0);
   if(angle > 360) angle = 0;
}
