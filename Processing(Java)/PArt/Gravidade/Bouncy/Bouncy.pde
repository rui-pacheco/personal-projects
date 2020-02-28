import shiffman.box2d.*;


Ball b = new Ball();

void setup(){
  size(800,600);

}

void  draw(){
  
  background(0);
  PVector gravity = new PVector (0,0.1);
  b.show();
  b.update();
  b.applyForce(gravity);
}
