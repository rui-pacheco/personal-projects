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

public class P2 extends PApplet {

CShape[] formas;
public void setup(){
	//noiseSeed(3);
	//randomSeed(1);
	background(255);
	
	formas=new CShape[50];
	for (int i = 0; i < formas.length; ++i) {
		formas[i]=new CShape();
	}
	for (CShape forma : formas) {
		forma.show();
	}

}
public void draw(){
	


	
}
class CShape{
	ArrayList<Float> points;
	float xoff=0.00f;
	float c;


	CShape(){
		points=new ArrayList<Float>();
		float l = random(5,10);
		for (int i = 0; i < l ; ++i) {
			xoff+=10;
			float v = map (noise(xoff),0,1,0,width);
			points.add(v);
		}

	
	 c =random(0, 255);
	}


	public void show(){
	colorMode(HSB);
	xoff+=0.5f;
	//float bn=map(sin(xoff),0,1,0,255);
	fill(c,200,255,60);
	strokeWeight(0.5f);
	//strokeJoin(BEVEL);
	//noStroke();
	beginShape();
	for (int i = points.size()-1; i > 0 ; i-=1) {
		vertex(points.get(i),points.get(i-1));
	}
		
    
    endShape(CLOSE);

	}

}
  public void settings() { 	size(600,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "P2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
