class Pix{
  int r,g,b;


  Pix(){
   r=(int)random(0,255);
   g=(int)random(0,255);
   b=(int)random(0,255);
  }
  
   Pix(int r, int g, int b){
   this.r=r;
   this.g=g;
   this.b=b;
  }
  
  void drawPix(){
    pushMatrix();
    stroke(r,g,b);
    rectMode(CENTER);
    popMatrix();
  }
  
  
  
  float getR(){
    return r;
  }
  
  float getG(){
    return g;
  }
  
  float getB(){
    return b;
  }
  
  void setR(int r){
     this.r=r;
  }
  
  void setG(int g){
     this.g=g;
  }
  
  void setB(int b){
     this.b=b;
  }
 
  
}
