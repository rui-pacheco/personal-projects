Particle p;

void setup(){
  p=new Particle(PI/2,200);
  size(800,600);
  
  
}

void draw(){
  background(0);
  p.display();
  p.update();

}
