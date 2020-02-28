class Ball{
  PVector location;
  PVector velocity;
  //PVector acceleration;
  
  Ball(){
    location = new PVector(width/2,height/2);
    velocity = new PVector(random(-1,1),random(-1,1));
    velocity.setMag(5);
    //acceleration = new PVector(0,0);
  
  }
  
  float getLocX(){
    return location.x;
  }
  
  void setLocX(float x){
    location.x=x;
  }
   
  float getLocY(){
    return location.y;
  }
  
  void setLocY(float y){
    location.x=y;
  }
  
  PVector getVel(){
    return velocity;
  
  }
  
  void setVel (PVector v){
    velocity = v;
  }
  
  void display(){
    ellipse(location.x,location.y,50,50);
  }
  
  void update(){
    velocity.limit(20);
    if(location.y<=25||location.y>=height-25){
       velocity.y=-(velocity.y);
       velocity.setMag(velocity.mag()+1);
    }
    else 
    if(/*location.x<=25||*/location.x>=width-25){
      velocity.x=-(velocity.x);
    }
 
    location.add(velocity);
  }
  

}
