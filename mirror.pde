import gab.opencv.*;                                //opencv 
import processing.video.*;                          //video   
import java.awt.*;                                  //util 
import java.util.*;                                 //for Date object
import http.requests.*;                             //http stuff
import java.io.File;                                //for deleting unnecessary files

//CONFIG TO SPRINGFIELD
String upload_folder = "/Users/frx5821/Desktop/mirror/upload/";  //set it to the upload folder after installation
String location = "springfield";                                 //it can be springfield or budapest

//BUDAPEST CONFIGURÁCIÓ -- Az upload_folder-t ki kell javítani a helyi könyvtárra!!!!!
//String upload_folder = "C:\\Users\\bs\\Desktop\\project_mirror\\app\\mirror\\upload\\"; 
//String location = "budapest";                                 


Capture video;                                      //viseo capture object
OpenCV opencv;                                      //face detect object
float[] cover = new float[4];                       //video image fit object
PImage uppermask;                                   //upper mirror black mask
PImage uppermask1;                                  //upper mirror black mask frame
int videox = 640;                                   //video x
int videoy = 480;                                   //video y
float mx = videox/2.0;                              //centerpoint of video x
float my =videoy/2.0;                               //centerpoint of video y  
float act = 1;                                      //mirror brightness value 

PImage face = createImage(videox,videoy,RGB);       //average image
int facel = videox*videoy;                          //average image pixel size                                   
float[] buf = new float[facel];                     //pixelbuffer for average image
int bufmax = 0;                                     //number of recorded images
int savenum = 100;                                  //reset average image

PImage[] movi = new PImage[1000];                   //movie images
int nmovie = 0;                                     //number of movie images
int actmovie = 0;                                   //movie frame number

int minute = minute();                              //starting minute;   
int interval = 1;                                   //interval for sync
//--------------------------------------------------------------
void setup()
{
  video = new Capture(this, videox, videoy);
  opencv = new OpenCV(this, videox, videoy);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  video.start();
  size(768,1024,P3D);
  surface.setResizable(true);
  uppermask =  loadImage("mask02.png");
  uppermask1 =  loadImage("mask01.png");
  readMovie();
}
//--------------------------------------------------------------
void draw()
{
  if(minute()-minute > interval) sync(); //thread("sync");
  cover=_cover(videox,videoy,width,height/2);
  background(0);
  opencv.loadImage(video);
  Rectangle[] faces = opencv.detect();
  float maxs = -10000;
  int sel = -1;
  for (int i = 0; i < faces.length; i++) 
  {
    float s = faces[i].width*faces[i].height;
    if(s > maxs) 
    {
      maxs=s;
      sel=i;
    }
  }
  
  float facex = 0;
  float facey = 0;
  
  float d=my;
  if(sel >= 0)
  {
    facex = faces[sel].x+(faces[sel].width/2.0);
    facey = faces[sel].y+(faces[sel].height/2.0);
    d = sqrt(((facex-mx)*(facex-mx))+((facey-my)*(facey-my)));
    if(d>my) d = my;
    if(d<20) d = 0.0;
    
  }
  if(d<(my/2.0)) imageIn(opencv.getOutput());
  act=lerp(act,d/my,0.2);
  opencv.flip(OpenCV.HORIZONTAL);
  clip(0,0,width,height/2);
  image(opencv.getOutput(),cover[2],cover[3],cover[0],cover[1]);
  noStroke();
  fill(0,0,0,act*200);
  rect(0,0,width,height/2);
  tint(255,act*250);
  image(uppermask,cover[2],cover[3],cover[0],cover[1]);
  noTint();
  image(uppermask1,cover[2],cover[3],cover[0],cover[1]);
  
  playMovie(act);
}
//--------------------------------------------------------------
//fit image into a frame
float[] _cover(float ix,float iy,float fx,float fy)
{
   float imgRatio = iy / ix;
   float canvasRatio = fy / fx;
   float[] res = new float[4];
   //println(canvasRatio+" > "+imgRatio);
   if(canvasRatio > imgRatio) 
   {
        res[1] = fy;
        float scale = res[1] / iy;
        res[0] = ix * scale;
        res[2] = -(res[0]-fx)/2.0; 
        res[3] = 0;
        
    }
    else
    {
        res[0] = fx;
        float scale = res[0] / ix;
        res[1] = iy * scale;
        res[2]=0;
        res[3]=-(res[1]-fy)/2.0;
        
    }
    return(res);
}
//--------------------------------------------------------------
//snapshot when face is on
void imageIn(PImage img)
{
  img.loadPixels();
  for(int i=0; i<facel; i++)
  {
    float r = img.pixels[i] >> 16 & 0xFF; //get red value -- image is grayscale
    buf[i]=buf[i]+r;
  }
  bufmax++;
  resetImage();
}
//--------------------------------------------------------------
//save an averaged image and reset image buffer for next
void resetImage()
{
  //print(bufmax); print(" ");
  if(bufmax > savenum)
  { 
    face = createImage(videox,videoy,RGB);
    for(int i=0; i<facel; i++)
    {
      int val = round(buf[i]/bufmax);
      face.pixels[(facel-i)-1]=color(val,val,val);
    }
    bufmax = 0;
    for(int i=0; i<facel; i++)
    {
      buf[i]=0;    
    }
    thread("post");
  } 
}
//--------------------------------------------------------------
//read last 100 files as a movie
void readMovie()
{
  nmovie=0;
  File[] files = listFiles("download");
  for(int i=0; i<files.length; i++)
  {
    File f = files[i];
    //print(f.getName());
    movi[i]=loadImage("download/"+f.getName());
    nmovie++;
  }
}
//--------------------------------------------------------------
//play movie
void playMovie(float act)
{
  clip(0,height/2,width,height);
  image(movi[actmovie],cover[2],height/2,cover[0],cover[1]);
  fill(0,0,0,act*250);
  rect(0,height/2,width,height/2);
  tint(255,act*250);
  image(uppermask,cover[2],height/2,cover[0],cover[1]);
  noTint();
  image(uppermask1,cover[2],height/2,cover[0],cover[1]);
  if(act < 0.5) actmovie++;
  if(actmovie >= nmovie) actmovie=0;
}
//--------------------------------------------------------------
//post image
void post()
{
  Date d = new Date();   
  String fname="face_"+d.getTime()+".jpg";
  face.save("upload/"+fname);
  PostRequest post = new PostRequest("https://exxite.hu/exxite/module_wireframe.php");
  post.addData("func", "w_upload");
  post.addData("pdata[location]", location);
  post.addFile("file",upload_folder+fname);
  post.send();
  System.out.println("Reponse Content: " + post.getContent());
  System.out.println("Reponse Content-Length Header: " + post.getHeader("Content-Length"));
  File f = new File(upload_folder+fname);
  f.delete();
}
//--------------------------------------------------------------
void mouseClicked() 
{
  sync();  
}

//get images from webserver
void sync()
{
  PImage buf1;
  String loc = "springield";
  if(location=="springfield") loc="budapest";
  if(location=="budapest") loc="springfield";
  
  File[] ofiles = listFiles("download");
  String[] oldfiles;
  String names="";
  for(int i=0; i<ofiles.length; i++)
  {
    File f = ofiles[i];
    names=names+"|"+f.getName();
  }
  oldfiles=reverse(sort(split(names,"|")));
  for(int i=0; i<ofiles.length; i++)
  {   
    if(i>100) 
    {
      File f = new File(oldfiles[i]);
      f.delete();
    }
  }
  
  print("sync: "); println(minute);
  minute=minute();
  PostRequest post = new PostRequest("https://exxite.hu/exxite/module_wireframe.php");
  post.addData("func", "w_download");
  post.addData("pdata[location]", location);
  post.send();
  String buf = post.getContent();
  String[] files =split(buf,"|");
  for(int i=0; i<files.length; i++)
  {
    File file=new File("download/"+files[i]);
    if(!file.exists())
    {
      buf1=loadImage("https://exxite.hu/exxite/exxitehu_mirror/"+loc+"/"+files[i]);
      buf1.save("download/"+files[i]);
    }
  }
  readMovie();
}
//--------------------------------------------------------------
//videoframe capture event handler
void captureEvent(Capture c) {
  c.read();
}
