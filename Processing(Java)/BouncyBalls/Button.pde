class Button{
  float x,y;
  float clr=250;
  
  Button(float x_,float y_){
    x=x_;
    y=y_;
  }
  void display(){
    pushMatrix();
    //rectMode(CENTER);
    fill(clr);
    rect(x,y,width,height/15);
    popMatrix();
    
    
  }
  
  void run(Ball b){
    if(overRect(x,y,width,y+height/20)==true && mousePressed){
      clr=0;
      b.move();
    }else{display();
    b.resetVel();}
  }
  
  boolean overRect(float x_, float y_, float width_, float height_) {
  if (mouseX >= x_ && mouseX <= x+width_ && 
      mouseY >= y_ && mouseY <= y+height_) {
    return true;
  } else {
    return false;
  }
}
  
}
