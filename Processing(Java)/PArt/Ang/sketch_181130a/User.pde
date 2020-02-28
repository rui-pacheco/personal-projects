class User{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float angle;
  float angleVelocity;
  
  
  User(){
    location = new PVector (0,0);
    velocity = new PVector (0,0);
    
    angleVelocity=0;
  }
  void update(){
    float x = mouseY/(sqrt(((mouseY)^2)*((mouseX)^2)));
    angle=asin(x);
    pushMatrix();
    translate(width/2,height/2);
    popMatrix();
  
  }
  void display(){
    pushMatrix();
    translate(width/2,height/2);
    rectMode(CENTER);
    rotate(angle);
    rect(location.x,location.y,20,10);
    popMatrix();
  }

}
