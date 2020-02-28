class PSegundos extends Particula{
  
  int segundo;
  float w=8,h=8;
  
  
  PSegundos(float x, float y , int h){
    super(x,y,8,8);
    segundo=h;
  }
  
  void display(){
    //hora=hour();
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x,pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(255,90);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
  
  int getSecond(){
  return segundo;
  }

}
