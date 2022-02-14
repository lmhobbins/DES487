sentence example;

void setup()
{
  size(1000,1000);
  example = new sentence("I_made_my_homework"); 
  example.add("I","You_Peter_Nobody_The devil_Whoever");
  example.add("made","stole_get_hide_nailed");
  example.add("my","your_his_hated_loved_long_awaited");
  example.add("homework","piece_case_instance_bag_victim_sacrifice");
}

void draw()
{
  background(255);
  String res = example.make();
  fill(0);
  textSize(64);
  text(res,100, 100,width-200,height);
  delay(1000);
}
