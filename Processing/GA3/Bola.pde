class Bola{
  float r,g,b;
  float x,y;
  
  Bola(){
    x=random(((width/2)-200),(width/2)+200);
    //y=random(((height/2)-200),(height/2)+200);
    y=10;
  }
  
  void display(float a, float b, float c){
    pushMatrix();
    x+=random(-20,20);
    y+=random(-20,20);
    //pushMatrix();
    stroke(a,b,c);
    //noFill();
    fill(a,b,c);
    textAlign(CENTER);
    text("r:"+a+"||g:"+b+"||b:"+c,x,y-10);
    ellipse(x,y,10,10);
    popMatrix();
    
  }
}
