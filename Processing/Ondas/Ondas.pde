ArrayList<Linha> linhas;
//Linha l;
int nOndas=5;

void setup(){
   
   
  linhas = new ArrayList<Linha>();
  size(400,400);
  //fullScreen();
  for(int i= 0,k=10*height/16; i<nOndas;i++,k-=30){
    
    linhas.add(new Linha(i,k,width,k));
  }
 //l=new Linha(0,height/2,width,height/2);
}

void draw(){
  background(50);
  for( Linha linha : linhas){
    //pushMatrix();
    linha.update();
    linha.display();
    
    //popMatrix();
  }
  
 
}

 void mousePressed(){
  exit();
  }
