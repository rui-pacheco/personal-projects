Mover m;

void setup(){
  size(800,800);
  m=new Mover();
}

void draw(){
  background(0);
  m.display();
  m.update();
}
