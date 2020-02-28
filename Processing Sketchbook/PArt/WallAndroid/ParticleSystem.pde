class ParticleSystem{
  ArrayList<Ball> balls = new ArrayList();
  PVector location;
  
  
  
  ParticleSystem(PVector l){
    location=l;
    for(int i=0; i < 10; i++){
       balls.add(new Ball(location));
    }
    
  }
  
  
  void display(){
    for( Ball b : balls){
      b.display();
      b.update();
    }
  
  }

}
