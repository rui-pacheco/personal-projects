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

public class P1 extends PApplet {

Sqr quadrados [] = new Sqr[100];

public void setup(){
	int index =0;
	
	for (int i = 0; i <200; i+=20) {
		for (int j =0; j<200; j+=20) {
			
		
		quadrados[index] = new Sqr(i+width/3+random(0,5),j+height/3+random(0,5));
		index++;
	}
	}

}
public void draw(){
background(50);
for (int i = 0; i < quadrados.length; ++i) {
		quadrados[i].show(); 
			}
}
class Sqr{
	float x;
	float y;
	float h,u,e;
	float w,l;

	Sqr(float a, float b){
		x=a+random(-1,1);
		y=b+random(-1,1);
		w=random(10,11);
		l=random(10,11);


	}

	public void show(){
		rectMode(CENTER);
		rect(x,y,w,l);
	}


}
  public void settings() { 	size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "P1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
