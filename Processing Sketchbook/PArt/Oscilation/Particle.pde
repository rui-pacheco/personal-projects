class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float angle; //<>// //<>//
  float angVelocity;
  float radius;
  
  Particle(float a, float r){
    radius=r;
    angle=a;
    location = convertPolar(a,r);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
    angVelocity=0.005;
  }
  
  void display(){
    pushMatrix();
    translate(width/2,height/2);
    line(0,0,location.x,location.y);
    rect(location.x,location.y,50,50);
    popMatrix();
  }
  
  void update(){

       location.sub(convertPolar(angle+angVelocity,radius));
  
    
    
    
  }
  
  PVector convertPolar(float a, float r){
    float x = r * cos(a);
    float y = r* sin(a);
    return new PVector(x,y);
  }
  

}
