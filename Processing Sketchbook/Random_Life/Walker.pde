class Walker{
  PVector position=new PVector(random(0,width),random(0,height));
  //PVector acceleration;
  PVector velocity=new PVector(random(-5,5),random(-5,5));
  
  int stamina=30;
  
  int delay = second()+1;
  
  float sleepTime=random(35,50);
  
  Walker(){
    position.x=random(0,width);
    position.y=random(0,height);
  }
  
  void walk(){

    
    
    if (second() == delay && stamina >= 1){
    
    position=position.add(velocity);
    velocity=new PVector(random(-5,5),random(-5,5));
    delay = second()+1;
    stamina=stamina-2;
    pushMatrix();
    translate(position.x,position.y);
    textAlign(CENTER);
    text("Walking : " + str(stamina),0,-10);
    popMatrix();
  }else if(stamina<=0){ sleep();}
  
  
    pushMatrix();
    ellipseMode(CENTER);
    translate(position.x,position.y);
   
    ellipse(0,0,10,10);
    popMatrix();
  
}


 void sleep(){
   while (stamina <100){
   
     if(delay==second()){
       
      pushMatrix();
     translate(position.x,position.y);
     textAlign(CENTER);
     
     text("Sleeping : " + str(stamina),0,-20);
     popMatrix();
    //delay = second()+1;
       stamina=stamina+2;
       print("sleep");
       delay=second()+1;
       stamina+=2;
    }
  }
 }

}
