import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Phyllotaxis extends PApplet {

Ball[] pontos;

float n;
//float preangle=137.3;
//float angle;
//float radius;
//float c=8;
//float count=0;
int cl;

public void setup(){
  pontos=new Ball[500];
  for( int i= 0,  j =20 ;i<pontos.length;i++,j+=1){
    pontos[i]=new Ball(0,0,j,i);
    n++;
  }
  
  
 colorMode(HSB, pontos.length);
 
 //fullScreen();
 //cl=color(n,255,255);
}
public void draw(){
  background(0);
  for(int i = 0 ; i<pontos.length;i++){
    pontos[i].update();
    pontos[i].display();
    
  }
  /*for(int n = 0 ; n<500;n++){
   angle = n*radians(preangle);
   radius=c*sqrt(n);
   float x = cos(angle)*radius;
   float y = sin(angle)*radius;
   
   
   pushMatrix();
   
   
   noStroke();
   fill(cl);
   ellipse(x+width/2,y+height/2,2,2);
   popMatrix();
   x=sin (count);
   preangle=map(x,0,1,137.3,137.6);
   count+=0.00002;
 }*/
}
class Ball{
  float x,y;
  float n;
float preangle=137.6f;
float angle;
float radius;
float c=5;
float count=0;
float cl;

  
  Ball(float x, float y, float cl, float n){
    this.x=x;
    this.y=y;
    this.cl=cl;
    this.n=n;
   }
   
   public void display(){
   pushMatrix();
   noStroke();
   // colorMode(HSB, 500);
   fill(cl,pontos.length,pontos.length);
   
   ellipse(x+width/2,y+height/2,2,2);
   popMatrix();
   }
   
   public void update(){
   angle = n*radians(preangle);
   radius=c*sqrt(n);
   x = cos(angle)*radius;
   y = sin(angle)*radius;
   float aux=sin (count);
   preangle=map(aux,0,1,137.3f,137.6f);
   count+=0.0005f;
   //this.cl=aux;
   //n+=0.001;
     }
   
}
  public void settings() {  size(400,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Phyllotaxis" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
