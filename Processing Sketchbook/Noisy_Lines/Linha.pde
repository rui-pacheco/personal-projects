class Linha{
  float x,x0,y,y0;
  ArrayList<PVector> pontos;
  float r;
  //float noiseCounter=0.001;
  float noiseCounter=random(0,0.5);
  int nrPontos=100;
  float clr = random(50,250);
  Linha(float xa,float ya){
    
    pontos=new ArrayList<PVector>();
    float xoff=0;
    x0=xa;y0=ya;
    r=50;
    for(float i =-width; i<=width;i+=0.1){
      y=sqrt((r*r)-(i*i));
      print(y);
     // float n = map(noise(xoff,noiseCounter),0,1,y-25,y+25);
      //float j = map(noise(xoff,noiseCounter),0,1,i-25,i+25);
      //y=n;
      //x=j;
      //pontos.add(new PVector(j,n));
      noiseCounter+=0.01;
      xoff=0.05;
    }
    /*for(float i = x1; i<=x2;i+=10){
      float n = map(noise(xoff,noiseCounter),0,1,y1-25,y1+25);
      pontos.add(new PVector(i,n));
      noiseCounter+=0.01;
      xoff=0.05;
    }*/
    
    noiseCounter+=0.5;
    
  }
  
  void display(){
    pushMatrix();
    noFill();
    //fill(0,0,clr,40);
    beginShape();
    //curveVertex(x1,y1);
    //curveVertex(0,height);
    //curveVertex(x,y);
    for(PVector p: pontos){
      stroke(clr,100,100);
     
      curveVertex(p.x,p.y);
      }
    //curveVertex(x2,y2);
     //curveVertex(width,height);
    endShape(OPEN);
    popMatrix();
  }
  
  void update(){
    float xoff=0;
     for(PVector p: pontos){
       // p.y= map(noise(xoff,noiseCounter),0,1,y-50,y+50);
       // p.x= map(noise(xoff,noiseCounter),0,1,x-25,x+25);
        xoff+=0.5;
      }
      
       noiseCounter+=0.007;
        if (clr<=255){
          clr+=0.5;
        }
       
       if (clr>=255){
         clr =random(50,250);
       }
  }
   
}
