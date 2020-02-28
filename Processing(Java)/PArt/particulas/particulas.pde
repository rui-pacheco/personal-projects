
Particula [] particulas = new Particula[500];

void setup(){
  size(600,600);
  for(int i = 0 ; i< particulas.length;i++){
    particulas[i]=new Particula();
  }
}

void draw(){
 
  background(0);
  translate(width/2,height/2);
  for(int o = 1; o<particulas.length;o++){
    particulas[o].update();
    particulas[o].show();}
    
  
  
}
