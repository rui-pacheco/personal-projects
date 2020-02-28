class Drop{
  float x= random(width);
  float y= random(-500,-100);
  float yspeed = random(2,8);
  float len = random(10,15);
  float r,g,b;
  Drop(){

  }
  
  void update(){
    y=y+yspeed;
    yspeed = yspeed + 0.02;
    
    if(y>height){
      y=random(-500.-100);
      yspeed=3;
    }
  
  }
  
  void show(){
    stroke(r,g,b);
    noFill();
    line(x,y,x,y+len);
    
  }
  
  void setRGB(float r, float g, float b){
    this.r=r;
    this.g=g;
    this.b=b;
  }
}
