class Ball{
  
  float x,y;
  float w,h;
  
  Ball (float a, float b ){
    x=a;
    y=b;
    
    w=16;
    h=16;
  }
  
  void display(){
    fill(127);
    stroke(0);
    ellipse(x,y,w,h);
  }
 
  
}
