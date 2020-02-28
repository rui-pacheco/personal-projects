class Light extends Particle{
  
  Light(){
    loc=new PVector(0,0);
  }
  
  void display(){
      //float glowRadius = 50.0 + 10 * sin(frameCount+(3*frameRate)*TWO_PI); 
      pushMatrix();
      translate(width/2,height/2);
      //strokeWeight(2);
      noStroke();
      
      for(float i=10,j=3; i > 0; i--,j-=0.1){
         fill(255,255,180,j);
         ellipse(loc.x,loc.y,i*10,i*10);
      }
      
       //noStroke();
      // fill(255,255,216);
       //for(float i = 0; i < glowRadius; i=i+0.5){
//fill(255,255,250,255.0*(1-i/glowRadius));
        
        fill(255,255,180);
      //}
      
       ellipse(loc.x,loc.y,50,50);
       popMatrix();
  }
}


/*  Thing(int x, int y, boolean glow){
    loc = new PVector(x,y);
    glowing = glow;
  }
  void display(){
    if(glowing){
      //float glowRadius = 100.0;
      float glowRadius = 100.0 + 15 * sin(frameCount/(3*frameRate)*TWO_PI); 
      strokeWeight(2);
      fill(255,0);
      for(int i = 0; i < glowRadius; i++){
        stroke(255,255.0*(1-i/glowRadius));
        ellipse(loc.x,loc.y,i,i);
      }
    }
    //irrelevant
    stroke(0);
    fill(0);
    ellipseMode(CENTER);
    ellipse(loc.x,loc.y,40,40);
    stroke(0,255,0);
    line(loc.x,loc.y+30,loc.x,loc.y-30);
    line(loc.x+30,loc.y,loc.x-30,loc.y);
  }
}*/
