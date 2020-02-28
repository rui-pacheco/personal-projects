class PMinutos extends Particula{
  
  int minuto;
  float w=10,h=10;
  
  
  PMinutos(float x, float y , int h){
    super(x,y,10,10);
    minuto=h;
  }
  
  void display(){
    //hora=hour();
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x,pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(150,90);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
  
  int getMinute(){
  return minuto;
  }

}
