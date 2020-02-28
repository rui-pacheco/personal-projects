
ArrayList<Linha> linhas;

void setup(){
  int nOndas=1;
  size(400,400); 
  linhas = new ArrayList<Linha>();
  //fullScreen();
  //for(int i= 0,k=10*height/16; i<nOndas;i++,k-=30){
    
    linhas.add(new Linha(width/2,height/2));
  //}
 //l=new Linha(0,height/2,width,height/2);
}

void draw(){ 
  background(50);
  for( Linha linha : linhas){
    //pushMatrix();
    linha.update();
    linha.display();
    
    //popMatrix();
  }}
