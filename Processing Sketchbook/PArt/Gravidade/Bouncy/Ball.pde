import shiffman.box2d.*;
class Ball{

  PVector location ;
  PVector acceleration;
  PVector velocity;
  
  
  
  Ball(float x, float y){
    location = new PVector(x,y);
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
  }
  
  void show(){
    pushMatrix();
    translate (width/2,height/2);
    noStroke();
    
    ellipse(location.x,location.y,20,20);
    popMatrix();
  }
  
  void update(){
   /* translate (width/2,height/2);
    if(location.y>=height/2-50){
       velocity = velocity.mult(-1);
    }
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    translate (-width/2,-height/2);*/
    
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
}
