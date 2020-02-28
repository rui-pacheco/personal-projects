User u;

void setup(){
  size(800,600);
  u=new User();
}

void draw(){
  background(0);
  u.update();
  u.display();
  

}
