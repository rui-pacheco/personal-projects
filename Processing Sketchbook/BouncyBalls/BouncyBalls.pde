import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Ball b1 ;
Ball b2 ;
Button button1,button2;


Vec2 f1;
float angulo;


void setup(){
  size(360,640);
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
void draw(){
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
