import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Ondas extends PApplet {

ArrayList<Linha> linhas;
//Linha l;
int nOndas=5;

public void setup(){
   
   
  linhas = new ArrayList<Linha>();
  
  //fullScreen();
  for(int i= 0,k=10*height/16; i<nOndas;i++,k-=30){
    
    linhas.add(new Linha(i,k,width,k));
  }
 //l=new Linha(0,height/2,width,height/2);
}

public void draw(){
  background(50);
  for( Linha linha : linhas){
    //pushMatrix();
    linha.update();
    linha.display();
    
    //popMatrix();
  }
  
 
}

 public void mousePressed(){
  exit();
  }
class Linha{
  float x1,x2,y1,y2;
  ArrayList<PVector> pontos;
  //float noiseCounter=0.001;
  float noiseCounter=random(0,0.5f);
  int nrPontos=100;
  float clr = random(50,250);
  Linha(float xa,float ya, float xb, float yb){
    
    pontos=new ArrayList<PVector>();
    float xoff=0;
    x1=xa;x2=xb;y1=ya;y2=yb;
    for(float i = x1; i<=x2;i+=10){
      float n = map(noise(xoff,noiseCounter),0,1,y1-25,y1+25);
      pontos.add(new PVector(i,n));
      noiseCounter+=0.01f;
      xoff=0.05f;
    }
    noiseCounter+=0.5f;
    
  }
  
  public void display(){
    pushMatrix();
    noFill();
    //fill(0,0,clr,40);
    beginShape();
    //curveVertex(x1,y1);
    //curveVertex(0,height);
    curveVertex(x1,y1);
    for(PVector p: pontos){
      stroke(clr,100,100);
     
      curveVertex(p.x,p.y);
      }
    curveVertex(x2,y2);
     curveVertex(width,height);
    endShape(OPEN);
    popMatrix();
  }
  
  public void update(){
    float xoff=0;
     for(PVector p: pontos){
        p.y= map(noise(xoff,noiseCounter),0,1,y1-50,y1+50);
        xoff+=0.5f;
      }
      
       noiseCounter+=0.007f;
        if (clr<=255){
          clr+=0.5f;
        }
       
       if (clr>=255){
         clr =random(50,250);
       }
  }
   
}
  public void settings() {  size(400,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ondas" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
