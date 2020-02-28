ParticleSystem p1,p2,p3;

void setup(){
 size(800,500);
 p1 = new ParticleSystem(new PVector(100,100));
 p2 = new ParticleSystem(new PVector(200,200)); 
 p3 = new ParticleSystem(new PVector(00,00));
 }

void draw(){
  background(0);
  translate(width/2,height/2);
  p1.display();
  p2.display();
  p3.display();
 
  
}
