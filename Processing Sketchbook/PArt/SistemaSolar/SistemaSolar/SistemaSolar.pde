  Planeta[] ps= new Planeta[7];
  Sun sol = new Sun();

void setup(){
  size(700,700);
  for(int i=0,j=50; i <ps.length; i++,j+=random(25,60)){
     ps[i] = new Planeta(j,height/2);
  }
  
}

void draw(){
  background(0);
  
  
  sol.show();
  for(int i=0; i <ps.length; i++){
      ps[i].show();
      ps[i].update();
  }
 
}
