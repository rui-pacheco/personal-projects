class Sun{
  PVector location;
  
  Sun(){
    location=new PVector(-width/2,-height/2);
  }
  
  void show(){
    translate(width/2,height/2);
    noStroke();
    fill(#FA5C00);
    ellipse(0,0,30,30);
    fill(255);
    stroke(0);
    translate(-width/2,-height/2);
  }
  
  PVector getLocVector(){
    
    return location;
  }
}
