import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import shiffman.box2d.*; 
import org.jbox2d.common.*; 
import org.jbox2d.collision.shapes.*; 
import org.jbox2d.dynamics.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class BouncyBalls extends PApplet {






Box2DProcessing box2d;

Ball b1 ;
Ball b2 ;
Button button1,button2;


Vec2 f1;
float angulo;


public void setup(){
  
  //fullScreen();
  
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  
  button1=new Button(0,56*height/60);
  button2=new Button(0,0);
  
  f1 =new Vec2();
  
  b1=new Ball(width/2,2*height/3);
  b2 = new Ball(width/2,height/3);
  b1.run();
  b2.run();
}
public void draw(){
  f1.set(0,0);
  background(255);
  box2d.step();
  b1.display();
  b2.display();
  //button.display();
  button1.run(b1);
  button2.run(b2);
  //b2.display();
 
  b1.applyForce(f1);
  //background(250);
}
class Ball{
  PVector force ;
  Vec2 f2D;
  float angle, angleVel=0.1f;
  Body body;
  float x,y;
  float radius=width/35;
  
  Ball(float xa, float ya){
    force=new PVector();
    angle = random(0,2*PI);
    x=xa;
    y=ya;
  }
  
  public void run(){
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    bd.fixedRotation=true;
    body = box2d.createBody(bd);
    
    //bdef=bd;
    
   
    
    
    CircleShape cs = new CircleShape();
    //float box2dX = box2d.scalarPixelsToWorld(x);
    //float box2dY = box2d.scalarPixelsToWorld(y);
    //cs.m_p.set(box2dX,box2dY);
    cs.m_radius=box2d.scalarPixelsToWorld(radius);
    
   
    
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
    fd.density = 0.5f;
    fd.friction = 0.1f;
    fd.restitution = 0.1f;
    
    body.createFixture(fd);
    
    
    
    
    
    
    
    
    
  }
  
  public void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    
    
    force=force.fromAngle(angle);
    
    force.setMag(10);
    
     f2D = new Vec2(force.x,-force.y);
    angle+=angleVel;
    
  
   
   
    
    pushMatrix();
    translate(pos.x,pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(50);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(0,0,radius*2,radius*2);
    translate(force.x,force.y);
    fill(150);
    ellipseMode(CENTER);
    ellipse(0,0,5,5);
    popMatrix();
    

  
    /*pushMatrix();
    translate(force.x,force.y);
    fill(50);
    ellipseMode(CENTER);
    ellipse(0,0,5,5);
    popMatrix();*/
  }
  
  public void update(){
    angleVel=0.1f;
    
  }
  
  public void applyForce(Vec2 force){
      Vec2 pos = body.getWorldCenter();
      body.applyForce(force,pos);
  }
  
  public void move(){
    
      angleVel=0;
      applyForce(f2D);
  }
  
  public void resetVel(){
    angleVel=0.1f;
  }
  
  
}
class Button{
  float x,y;
  float clr=250;
  
  Button(float x_,float y_){
    x=x_;
    y=y_;
  }
  public void display(){
    pushMatrix();
    //rectMode(CENTER);
    fill(clr);
    rect(x,y,width,height/15);
    popMatrix();
    
    
  }
  
  public void run(Ball b){
    if(overRect(x,y,width,y+height/20)==true && mousePressed){
      clr=0;
      b.move();
    }else{display();
    b.resetVel();}
  }
  
  public boolean overRect(float x_, float y_, float width_, float height_) {
  if (mouseX >= x_ && mouseX <= x+width_ && 
      mouseY >= y_ && mouseY <= y+height_) {
    return true;
  } else {
    return false;
  }
}
  
}
  public void settings() {  size(360,640); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "BouncyBalls" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
