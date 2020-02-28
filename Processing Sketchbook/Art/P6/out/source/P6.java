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

public class P6 extends PApplet {

Ball[] balls = new Ball[2];

public void setup() {
    
    for(int i = 0; i < balls.length; ++i){
        balls[i]=new Ball();
    }
}

public void draw() {
    background(0);
    for (int i = 0; i < balls.length; ++i) {
        balls[i].show();
    }

    
    
}
public class Ball {
    int x;
    int y;
    int vel;
    int r;
    public Ball () {
        x=(int)random(0, width);
        y=(int)random(0,height);
        r=5;
    }

    public void show(){
        pushMatrix();
        fill(255);
        ellipse(x, y,r ,r );
        popMatrix();
    }

    public double getDistance(Ball ball){
        double ac = Math.abs(ball.y - this.y);
        double cb = Math.abs(ball.x - this.x); 
        return Math.hypot(ac, cb);
    }

}
public class Lin {
    public Lin () {
        
    }

}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "P6" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
