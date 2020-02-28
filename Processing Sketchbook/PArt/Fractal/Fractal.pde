
  float angle;
  float len;
  float px;
  float py;
  float x;
  float y;
void setup(){
  x=0;
  y=0;
  px=0;
  py=0;
  size(800,600);
  //noLoop();

}

void draw(){
  background(255);
  arvoreFractal(PI/2,100);
  
}

void arvoreFractal(float ang, float le){
  while(true){
  if (le >=1) {
    
    px=x;
    py=y;
    x = cos (ang) * le;
    y = - sin (ang) * le;
    pushMatrix();
    translate(width/2, height/2);
    line(px,py,x,y);
    popMatrix();
    arvoreFractal(ang+PI/4, le-10);
    arvoreFractal(ang-PI/4, le-10);
}
    else{
    line(px,py,x,y);
    break;}
  }}
