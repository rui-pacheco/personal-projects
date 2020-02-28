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

public class GA3 extends PApplet {

int maxPop =10;
DNA[] population = new DNA[maxPop];
Bola[] bolas = new Bola[maxPop];
ArrayList<DNA> matingPool ;
float mutationRate=0.5f;
int counter=0;
Drop[] Drops = new Drop[1000];

DNA best;

public void setup(){
  
  for (int i = 0 ; i< Drops.length; i++){
    Drops[i]=new Drop();
  }
  for (int i= 0; i<maxPop;i++){
      population[i] = new DNA();
      bolas[i]=new Bola();
      
      
  }  
  
}

public void draw(){
  
  background(0);
  text("Geração"+counter,50,30);
 
 for (int i = 0 ; i< Drops.length; i++){
    Drops[i].update();
    Drops[i].show();
  }
/* if(mousePressed){
 for (int i = 0; i < population.length; i++) {
  population[i].fitness();}
  getBest();
  background(best.getGenes()[0],best.getGenes()[1],best.getGenes()[2]);
    
    selection();
    reproduction();
    
     
  }*/}
  
public void selection(){
    matingPool = new ArrayList<DNA>();
    
    for (int i = 0; i < population.length; i++) {
      
      int n = PApplet.parseInt(population[i].fitness * 100);
  //println(population[i]);
    for (int j = 0; j < n; j++) {
      
      matingPool.add(population[i]);
      
    }
    //println(matingPool);
  }
}

public void reproduction(){
  for (int i = 0; i < population.length; i++) {
   int a = PApplet.parseInt(random(matingPool.size()));
   int b = PApplet.parseInt(random(matingPool.size()));
      
   DNA parentA = matingPool.get(a);
   DNA parentB = matingPool.get(b);
   
   DNA child = parentA.crossover(parentB);
   
   child.mutate();
    population[i] = child;
  }
}

public DNA getBest(){
  float fit=0;
  for(int i =0;i<population.length;i++){
    if(population[i].fitness>fit){
      best=population[i];
      fit=population[i].fitness;
    }
  }
   println("Melhor Fitness: " + best.fitness);
  println(best.getGenes());
  return best;
}

public void mouseClicked(){
  
  
 
  
  for (int i = 0; i < population.length; i++) {
    
    population[i].fitness();}
    getBest();
    for (int i = 0,k=0; i < population.length; i++,k+=((Drops.length)/maxPop)) {
      for(int j = 0+k; j <((Drops.length)/maxPop)+k;j++)
    Drops[j].setRGB(population[i].genes[0],population[i].genes[1],population[i].genes[2]);
    
  //bolas[i].display(population[i].genes[0],population[i].genes[1],population[i].genes[2]);
    //background(best.getGenes()[0],best.getGenes()[1],best.getGenes()[2]);
    }
    selection();
    reproduction();
    counter++;
}


  
class Bola{
  float r,g,b;
  float x,y;
  
  Bola(){
    x=random(((width/2)-200),(width/2)+200);
    //y=random(((height/2)-200),(height/2)+200);
    y=10;
  }
  
  public void display(float a, float b, float c){
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
class DNA{
  float[] genes = new float[3];
  float[] target = {200,25,14} ;
  float fitness;
  
  
  DNA(){
    for (int i= 0; i<genes.length;i++){
      genes[i] = random(0,255);
    }
  }
  
  
  public void fitness(){
    float score= 0;
    for (int i= 0; i<genes.length;i++){
      float d = 255 - abs(target[i]-genes[i]);
      score = score +d;
    }
    fitness = score;
    
  }
  
  public DNA crossover(DNA partner){
    
  float[] diffTargetP1=new float[genes.length];
  float[] diffTargetP2=new float[genes.length];
  DNA child = new DNA();
  for(int i = 0; i<genes.length;i++){
    diffTargetP1[i]=abs(target[i]-genes[i]);
    diffTargetP2[i]=abs(target[i]-partner.genes[i]);}
  
  for(int i = 0; i<genes.length;i++){
    if(diffTargetP1[i]<diffTargetP2[i]){
    child.genes[i]=genes[i];}else{child.genes[i]=partner.genes[i];}
  }
    
  
  return child;
}

 public void mutate(){
   for(int i = 0; i<genes.length;i++){
     if(random(1)<mutationRate){
       int j =(int)random(-5,5);
       if(genes[i]+j<=255&&genes[i]+j>=0){
       genes[i] +=j; }
     }
   }
 }
 public float[] getGenes(){
   return genes;
 }
 
}
class Drop{
  float x= random(width);
  float y= random(-500,-100);
  float yspeed = random(2,8);
  float len = random(10,15);
  float r,g,b;
  Drop(){

  }
  
  public void update(){
    y=y+yspeed;
    yspeed = yspeed + 0.02f;
    
    if(y>height){
      y=random(-500.f-100);
      yspeed=3;
    }
  
  }
  
  public void show(){
    stroke(r,g,b);
    noFill();
    line(x,y,x,y+len);
    
  }
  
  public void setRGB(float r, float g, float b){
    this.r=r;
    this.g=g;
    this.b=b;
  }
}
  public void settings() {  size(600,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GA3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
