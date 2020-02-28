class Particula{
  float x;
  float y;
  float z;
  float angle;
  float radius;
  float sx;
  float sy;
  float r;
  float z1;
  
  Particula(){
    x=random(-width,width);
    y=random(-height,height);
    z=random(width);
    r=10;
  }

  void show(){
    noStroke();
     sx = map(x/z,0,1,0,width);
     sy = map(y/z,0,1,0,height);
    
    ellipse(sx,sy,r,r);
  }


void update(){
    z=z+random(0,25);
    if (z>5000){
      z=z+random(0,25);
    fill(#ff0000);
    z1=z;
    }
  if (z>10000){
    //z=random(10000,20000);
    fill(random(200,255),50,0);
    //x=random(-width, width);
    //y=random(-height,height);
    r+=0.2;
    z1=z1+random(0,25);
  }
  if (z1>20000){
    z=random(width);
    r-=0.5;
    x=random(-width,width);
    y=random(-height,height);
    z1=z1+random(0,25);
  }
  
  if (z1>25000){
    z1=0;
  }
  

  
}
    

    
    

}
