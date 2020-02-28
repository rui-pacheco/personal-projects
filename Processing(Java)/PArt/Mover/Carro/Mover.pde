class Mover{

  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover(){
    location = new PVector(0,0);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  
  void display(){
    pushMatrix();
    translate(width/2,height/2);
    rectMode(CENTER);
    rect(location.x,location.y,10,20);
    popMatrix();
  }
  
  void update(){
    location.add(velocity);
    velocity.add(acceleration);
    if( key=='w' || key == 'W'){
       acceleration.add(new PVector(0,-0.01));
    }else if( (key=='S' || key == 's')){
       acceleration.add(new PVector(0,0.1));
    }
    velocity.limit(3);
   
  }
  
}
