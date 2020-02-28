class Planeta{
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector gravity;
  Sun sol;
  float cor;
  
  Planeta(int x, int y){
    
    
    location = new PVector(x,y);
    velocity = new PVector(0,random(1.5,2));
    acceleration = new PVector(0,0);
    sol=new Sun();
    cor = random(100,255);
  }
  
  void update(){
    PVector solV=new PVector ((width/2),(height/2));
    solV.sub(location);
    solV.setMag(0.02);
    acceleration = solV;
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(2);
    }
    
  void show(){
    noStroke();
    fill(cor);
    ellipse(location.x,location.y,10,10);
    stroke(0);
  }

}
