class Ball{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  PVector locAbsoluta;
  
  float duration = random(-200,-100);
  
  Ball(PVector p){
    locAbsoluta=p;
    location = new PVector (random(-50+locAbsoluta.x,50+locAbsoluta.x),random(0+locAbsoluta.y,50+locAbsoluta.y));
    velocity = new PVector (0,0);
    acceleration = new PVector (0,random(-0.2,-0.1));
    
  }
  
  void display(){
    
    ellipse(location.x,location.y,5,5);
    if (location.y< duration){
      location = new PVector (random(-50+locAbsoluta.x,50+locAbsoluta.x),random(0+locAbsoluta.y,50+locAbsoluta.y));
    }
  
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(random(2,3));
   
  }


}
