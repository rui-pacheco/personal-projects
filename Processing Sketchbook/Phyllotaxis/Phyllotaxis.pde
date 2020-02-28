Ball[] pontos;

float n;
//float preangle=137.3;
//float angle;
//float radius;
//float c=8;
//float count=0;
int cl;

void setup(){
  pontos=new Ball[500];
  for( int i= 0,  j =20 ;i<pontos.length;i++,j+=1){
    pontos[i]=new Ball(0,0,j,i);
    n++;
  }
  
  
 colorMode(HSB, pontos.length);
 size(400,400);
 //fullScreen();
 //cl=color(n,255,255);
}
void draw(){
  background(0);
  for(int i = 0 ; i<pontos.length;i++){
    pontos[i].update();
    pontos[i].display();
    
  }
  /*for(int n = 0 ; n<500;n++){
   angle = n*radians(preangle);
   radius=c*sqrt(n);
   float x = cos(angle)*radius;
   float y = sin(angle)*radius;
   
   
   pushMatrix();
   
   
   noStroke();
   fill(cl);
   ellipse(x+width/2,y+height/2,2,2);
   popMatrix();
   x=sin (count);
   preangle=map(x,0,1,137.3,137.6);
   count+=0.00002;
 }*/
}
