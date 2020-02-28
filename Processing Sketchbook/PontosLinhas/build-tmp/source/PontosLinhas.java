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

public class PontosLinhas extends PApplet {

int len=8;

Ponto[] pontos = new Ponto[len];

public void setup(){
  
  for(int i = 0; i<len;i++){
    pontos[i]=new Ponto();
  }
}
public void draw(){
  background(0);
  
  for( int i=0;i<pontos.length;i++){
    pontos[i].update();
    pontos[i].show();}

    for( int i=0;i<pontos.length;i++){
    	for (int j = 0; j < pontos.length; ++j) {
    		strokeWeight(0.2f);
    		line(pontos[i].getX(),pontos[i].getY(),pontos[j].getX(),pontos[j].getY());
    	}
  }
  
}


class Ponto{
  float x,y;
  float a;
  
  Ponto(){
    x=random(0,width);
    y=random(0,height);
  }
  
  public void show(){
    ellipseMode(CENTER);
    ellipse(x,y,7,7);
  }
  
  public void update(){
    float b=map(sin(a),0,1,0,255);
    colorMode(HSB);
    fill(b,250,250);
    stroke(b,250,250);
    a+=0.001f;
    x+=random(-0.5f,0.5f );
    y+=random(-0.5f,0.5f );
  }

  public float getX(){
    return x;
  }

  public float getY(){
    return y;
  }
  
}
  public void settings() {  size(600,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "PontosLinhas" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
