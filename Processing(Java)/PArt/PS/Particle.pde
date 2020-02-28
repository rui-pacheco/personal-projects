class Particle{
  PVector loc;
  float vel;
  PVector acc;
  
  //float amplitude;
  
  float angle;
  //float lifespan;
  //float clr;
  
  Particle(){
      loc = new PVector (random(-100,100),random(-100,100));
      vel =0.0007;
      angle = 0;
     // amplitude = 100;
  }
 
 void display(){
   
   //noStroke();
   pushMatrix();
     stroke(0);
     fill(255);
     translate(width/2,height/2);
     ellipse(loc.x,loc.y,2,2);
     popMatrix();
  /* for(int i=0; i < width; i+=4){
     pushMatrix();
     stroke(0);
     fill(255);
     translate(0,height/2);
     loc.y=amplitude*sin(angle)+random(1,5);
     loc.x=i;
     angle+=vel;
     ellipse(loc.x,loc.y,2,2);
     popMatrix();
   }*/
 }
 
 void update(){
   //loc.add(vel);
   //vel.add(acc);
   
   loc.x+=random(-2,2);
   loc.y+=random(-2,2);
   
   
   
 }
 
 PVector getLoc(){
   return loc;
 }
  
  
}
