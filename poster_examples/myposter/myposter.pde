circ[] c =new circ[1000];
int ncirc = 1000;
PFont font;


void setup() 
{
   //size(1000,600);
   fullScreen();
   font = createFont("Lato-Black.ttf",width/12);
   for(int i = 0; i < ncirc; i = i + 1)
   {
     c[i]=new circ();
   }
}

void draw()
{
  fill(color(255,255,255,1));
  noStroke();
  rect(0,0,width,height);
  for(int i = 0; i < ncirc; i = i + 1)
  {
     c[i].show();
     if(i==round(ncirc/2)) showText();
  }
}

void showText()
{
  textFont(font);
  textAlign(CENTER, CENTER);
  fill(color(255,255,255,5));
  text("IT IS BETTER TO LIGHT A CANDLE THAN TO CURSE THE DARKNESS",0,0,width,height);
}
