String[] sentences = {
"The quick brown fox jumps over the lazy dog.",
"The little red hood wins over the evil wolf.",
"The big bad wolf eats up the poor granny."
};

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
 
  int index = round(random(2));
 
  text(sentences[index],0, 100,width,height);
  delay(600);

}
