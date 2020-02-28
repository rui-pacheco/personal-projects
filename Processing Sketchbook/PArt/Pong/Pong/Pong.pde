Player1 p1;
Ball b;
void setup(){
  size(800,600);
  p1=new Player1();
  b=new Ball();
}

void draw(){
  background(0);
  p1.display();
  b.display();
  b.update();
}

 void mouseDragged(){
    p1.setLocation(mouseY);
    p1.kick(b);
  }
