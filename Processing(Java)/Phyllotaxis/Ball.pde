class Ball{
  float x,y;
  float n;
float preangle=137.6;
float angle;
float radius;
float c=5;
float count=0;
float cl;

  
  Ball(float x, float y, float cl, float n){
    this.x=x;
    this.y=y;
    this.cl=cl;
    this.n=n;
   }
   
   void display(){
   pushMatrix();
   noStroke();
   // colorMode(HSB, 500);
   fill(cl,pontos.length,pontos.length);
   
   ellipse(x+width/2,y+height/2,2,2);
   popMatrix();
   }
   
   void update(){
   angle = n*radians(preangle);
   radius=c*sqrt(n);
   x = cos(angle)*radius;
   y = sin(angle)*radius;
   float aux=sin (count);
   preangle=map(aux,0,1,137.3,137.6);
   count+=0.0005;
   //this.cl=aux;
   //n+=0.001;
     }
   
}
