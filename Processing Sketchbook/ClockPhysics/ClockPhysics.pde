import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Superficie s1,s2,s3;
Chao chao;
ArrayList<PHoras> horas;
ArrayList<PMinutos> minutos;
ArrayList<PSegundos> segundos;
PFont font;


void setup(){
  //fullScreen();
  size(500,600);
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  chao=new Chao();
  s1=new Superficie(width/4,height/2);
  s2=new Superficie(2*width/4,height/2);
  s3=new Superficie(3*width/4,height/2);
  horas=new ArrayList();
  minutos = new ArrayList();
  segundos = new ArrayList();
  
  
 // text("dsadsada",width/2,height/2);
  //int j;
  for(int i = 0,a=0,k=0 ; i<4;k=k+20,i++ ){
    for(int j = 0,l=0 ; j <6 ;j++,l+=20 ){
      horas.add(new PHoras(width/4,height/4,a));
      a++;
    }}
    
    for(int i = 0,a=0,k=0 ; i<6;k=k+15,i++ ){
    for(int j = 0,l=0 ; j <10 ;j++,l+=15 ){
      minutos.add(new PMinutos(2*width/4,height/4,a));
      a++;
    }
    //j++;
    
  }
  
   for(int i = 0,a=0,k=0 ; i<6;k=k+10,i++ ){
    for(int j = 0,l=0 ; j <10 ;j++,l+=15 ){
      segundos.add(new PSegundos(/*73**/3*width/4/*100+ k*/,/*150-l*/height/4,a));
      a++;
    }
    //j++;
    
  }
  
  
}

void draw(){
 
  background(150);
  box2d.step();
  s1.display();
  s2.display();
  s3.display();
  chao.display();
  pushMatrix();
  fill(0);
  font = loadFont("AgencyFB-Reg-48.vlw");
  textFont(font);
  textSize(20);
  
  text(hour(), width/4,2*height/3);
  text(minute(), 2*width/4,2*height/3);
  text(second(),3*width/4,2*height/3);
  popMatrix();

  
  for (int i = 0; i<24;i++){
     
      if(horas.get(i).getHour()<hour()){
          horas.get(i).display();
          horas.get(i).applyForce(new Vec2(random(-1,1),-20));
      } else{
       //for (int j = 0; j<60;j++){
         
         horas.get(i).resetPos();
       //}
  
    
  }
  }
  for (int i = 0; i<60;i++){
      /*minutos.get(i).display();*/
      
      if(minutos.get(i).getMinute()<=minute()){
          minutos.get(i).display();
          minutos.get(i).applyForce(new Vec2(random(-1,1),-20));
      } else{
       //for (int j = 0; j<60;j++){
         minutos.get(i).resetPos();
       //}
  
    
  }
  }
  
    for (int i = 0; i<60;i++){
      
      if(segundos.get(i).getSecond()<second()){
          segundos.get(i).display();
          segundos.get(i).applyForce(new Vec2(random(-1,1),-20));
      }
      else{
       //for (int j = 0; j<60;j++){
         segundos.get(i).resetPos();
       //}
  
    
  }
        }
        
      }
  
