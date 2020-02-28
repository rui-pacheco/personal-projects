class PHoras extends Particula{
  
  int hora;
  float w=15,h=15;
  
  
  PHoras(float x, float y , int h){
    super(x,y,15,15);
    hora=h;
  }
  
  void display(){
    //hora=hour();
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x,pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(50,90);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
  
  int getHour(){
  return hora;
  }

}
