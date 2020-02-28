class Player1{
  PVector location = new PVector(0,height/2);
  PVector velocity = new PVector(0,0);

  Player1(){
    
  }
  
  void display(){
    rectMode(CENTER);
    rect(location.x,location.y,50,100);
  }
  
  void update(){
    location.y=mouseY;
     
  }
  
  void setLocation(float y){
    location.y=y;
  }
  
  void kick (Ball b){
    if(b.getLocX()<=location.x+25+25 && b.getLocY()>=location.y-50-25 && b.getLocY()<=location.y+50+25){
       b.setVel(new PVector(-b.getVel().x,b.getVel().y));
    }
    
  }

}
