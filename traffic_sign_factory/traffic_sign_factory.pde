String base;
String top;
String motiv;

void setup()
{
  size(1000,800);
}

void draw()
{
  background(color(0,0,0));
  traffic_sign sign = new traffic_sign();
  sign.fillStop("stop_bs05.svg,stop_bs08.svg,warning.svg,stop_bs03.svg,stop_bs06.svg,stop_bs09.svg,stop_bs04.svg,stop_bs07.svg,stop_bs10.svg");
  sign.fillWarn("stop_bs05.svg,stop_bs08.svg,warning.svg,stop_bs03.svg,stop_bs06.svg,stop_bs09.svg,stop_bs04.svg,stop_bs07.svg,stop_bs10.svg");
  sign.fillRect("stop_bs05.svg,stop_bs08.svg,warning.svg,stop_bs03.svg,stop_bs06.svg,stop_bs09.svg,stop_bs04.svg,stop_bs07.svg,stop_bs10.svg");
  
  
  sign.make();
  
  
  delay(1000);
}
