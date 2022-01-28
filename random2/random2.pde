String[] half = {"half","first","lost","second","cursed"}; 
String[] way = {"way","part","sin","joy"};  
String[] through = {"through","by"}; 
String[] journey = {"journey","passion","challange","tunnel"};
String[] our = {"our","your","their","humble"};
String[] life = {"life","death","fun"};
String[] I_found = {"I found"};
String[] I_was = {"I was"};
String[] in = {"in"};
String[] a_gloomy = {"a gloomy","a dark","the reta\nrded","deserted","the new found","a marked","targeted","an ugly"};
String[] wood = {"wood","forest","slum","mood","period"};
String[] the_path = {"the path"};
String[] led = {"led"};
String[] aright = {"aright"};
String[] was_lost = {"was lost"};
PFont font;

void setup()
{
   size(1000,800);
   font = createFont("LibreBaskerville-Regular.ttf",64);
   textFont(font, 72);
}

void draw()
{
  fill(color(0,0,0));
  rect(0,0,width,height);

  fill(color(255,255,255));
  textSize(64);
  textAlign(LEFT);
  
  String sentence = "When "+
  half[round(random(half.length-1))]+" "+
  way[round(random(way.length-1))]+" "+
  through[round(random(through.length-1))]+
  " of "+
  our[round(random(our.length-1))]+" "+
  life[round(random(life.length-1))]+" "+
  I_found[round(random(I_found.length-1))]+" that "+
  I_was[round(random(I_was.length-1))]+" "+
  in[round(random(in.length-1))]+" "+
  a_gloomy[round(random(a_gloomy.length-1))]+" "+
  wood[round(random(wood.length-1))]+" because "+
  the_path[round(random(the_path.length-1))]+" which "+
  led[round(random(led.length-1))]+" "+
  aright[round(random(aright.length-1))]+" "+
  was_lost[round(random(was_lost.length-1))]+".";
  
 
  text(sentence,100, 100,width-200,height);
  delay(5600);

}

/*
This is a random sentence generator
Made by us.
*/
