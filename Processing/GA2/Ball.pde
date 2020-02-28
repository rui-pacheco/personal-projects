class Ball{
  PVector location;
  
  
  Ball(){
    location=new PVector(width,random(0,height));
    
  }
  
  Ball(PVector loc){
    location=loc;
    
  }
  
  void applyForce(PVector velocity){
    location.add(velocity);
  }
  
  void applyForces(PVector[] genes){
    for( PVector g:genes){
      location.add(g);
    }
    
  }
  void display(){
    translate(location.x,location.y);    // Using the Vec2 position and float angle to
    fill(50);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(0,0,20,20);  
  }
  
  float getDistance(PVector p){
    return location.dist(p);
  }
  
  PVector getLocation(){
    return location;
  }
  
  
}
