Particula[] p = new Particula[500];
Particula[] s = new Particula[500];

void setup(){
  frameRate(60);
  size(600,600);
    for(int i=-100,j=0; i <= 100 ; i++, j++){
     p[j]=new Particula(i);  
  }
   for(int i=-100,j=0; i <= 100 ; i++, j++){
     s[j]=new Particula(i);  
  }
}

void draw(){
  
  translate(width/2, height/2);
  rotate(PI/2);
  background(255);
  printBola();
  translate(width/4,0); 
  printBola();
  translate(-width/2,0); 
  printBola();
  translate(width/4,height/4); 
  printBola();
  translate(0,-height/2); 
  printBola();
  
}

 void printBola(){
     for(int i=0; i <=200; i++){
       p[i].show();
       p[i].update();}
  }
