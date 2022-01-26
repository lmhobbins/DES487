String[] quick = {"quick","little","big","nasty","nice","new","old","spiky"};
String[] brown = {"brown","red","bad","big","small","rusty"};
String[] fox = {"fox","hood","wolf","car","tree","professor","girl","boy","star"};
String[] jumps = {"jumps","eats","wins","steps","decides","rules","looks"};
String[] over = {"over","up","for","under","below","by"};
String[] lazy = {"lazy","evil","good","neutral","chaotic","poor","standard"};
String[] dog = {"dog","granny","wolf","idea","food","plate","class"};

void setup()
{
   size(1000,800);
}

void draw()
{
  fill(color(0,0,0));
  rect(0,0,width,height);

  fill(color(255,255,255));
  textSize(72);
  textAlign(CENTER);
  
  String sentence = "The "+
  quick[round(random(quick.length-1))]+" "+
  brown[round(random(brown.length-1))]+" "+
  fox[round(random(fox.length-1))]+" "+
  jumps[round(random(jumps.length-1))]+" "+
  over[round(random(over.length-1))]+" the "+
  lazy[round(random(lazy.length-1))]+" "+
  dog[round(random(dog.length-1))]+".";
 
  //int index = round(random(2));
 
  text(sentence,0, 100,width,height);
  delay(3600);

}

/*
This is a random sentence generator
Made by us.
*/
