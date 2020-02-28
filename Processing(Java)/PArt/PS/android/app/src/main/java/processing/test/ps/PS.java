package processing.test.ps;

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

public class PS extends PApplet {

Particle p ;
ArrayList<Particle> ps;
Connector c;
ArrayList<Connector> cs;
Particles particles;
ArrayList<Particles> psal;
TDate data;

public void setup(){
  
  ps = new ArrayList <Particle>();
  cs = new ArrayList <Connector>();
  psal = new ArrayList<Particles>();
  data= new TDate();
  
  for ( int i = 0; i<50;i++){
    ps.add(new Particle());
    
  }
  particles= new Particles(ps,cs);
  
}

public void draw(){
  background(0);
  particles.run();
  data.display();
  data.update();
  }
    
    
    //cs.get(9).connect(ps.get(9),ps.get(0)); 
    
    
   
  
  
  
  
class Connector{
  Particle p1;
  Particle p2;
  
  Connector(Particle pp1, Particle pp2){
      pushMatrix();
      stroke(255);
      translate(width/2,height/2);
      p1 = pp1;
      p2 = pp2;
      line(p1.getLoc().x, p1.getLoc().y,p2.getLoc().x,p2.getLoc().y);
      popMatrix();}
    
 /* void connect(Particle pp1, Particle pp2){
    
      pushMatrix();
      stroke(255);
      translate(width/2,height/2);
      p1 = pp1;
      p2 = pp2;
      line(p1.getLoc().x, p1.getLoc().y,p2.getLoc().x,p2.getLoc().y);
      popMatrix();
    
}*/


}
class Particle{
  PVector loc;
  float vel;
  PVector acc;
  
  float amplitude;
  
  float angle;
  float lifespan;
  float clr;
  
  Particle(){
      loc = new PVector (0,0);
      vel =0.0007f;
      angle = 0;
      amplitude = 100;
  }
 
 public void display(){
   
   //noStroke();
   
   
  
   for(int i=0; i < width; i+=4){
     pushMatrix();
     stroke(0);
     fill(255);
     translate(0,height/2);
     loc.y=amplitude*sin(angle)+random(1,5);
     loc.x=i;
     angle+=vel;
     ellipse(loc.x,loc.y,2,2);
     popMatrix();
   }
 }
 
 public void update(){
   //loc.add(vel);
   //vel.add(acc);
   
   //loc.x+=random(-2,2);
   //loc.y+=random(-2,2);
   
   
   
 }
 
 public PVector getLoc(){
   return loc;
 }
  
  
}
class Particles{
  ArrayList<Particle> ps;
  ArrayList<Connector> cs;
  int y;
  
  Particles(ArrayList<Particle> ps,ArrayList<Connector> cs){
    this.ps=ps;
    this.cs=cs;
  }
  
  
  public void run(){
    for(int i=0; i<ps.size(); i++){
      //print(" "+ps.get(i).getLoc().x+" ");
      ps.get(i).display();
      ps.get(i).update();
      //ps.get(i).display();
      if(i!=ps.size()-1){
        cs.add(new Connector((ps.get(i)),ps.get(i+1)));
      }else {
        cs.add(new Connector((ps.get(i)),ps.get(0)));
      }
    }
  }
}
class TDate{
  int day;
  int month;
  int year;
  
  
  int hour;
  int minute;
  int second;
  
  TDate(){
    day=day();
    month=month();
    year=year();
    
    hour=hour();
    minute=minute();
    second = second();
    
  }
  
  public void display(){
    text(String.valueOf(day)+" - "+String.valueOf(month)+" - "+String.valueOf(year), 10, 30);
    text(String.valueOf(hour)+" : "+String.valueOf(minute)+" : "+String.valueOf(second), 10, 60);
  }
  
  public void update(){
     day=day();
    month=month();
    year=year();
    
    hour=hour();
    minute=minute();
    second=second();
  }
}
  public void settings() {  size(360,640); }
}
