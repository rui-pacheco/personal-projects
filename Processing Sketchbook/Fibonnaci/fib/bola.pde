class Quadrado{
  float x;
  float y;
  float z;
  int nivelFib;
  float cor;
  Quadrado(int nv){
    x=0;
    y=0;
    nivelFib=nv;
  }
  
  void update(){
    x=x+8;
    //cor=map(nivelFib,0,1,200,250);
    
    if (x>=height){
      y=y+8;
      x=0;
    }
    
  }
  
  
  void show(){
    print(":|"+x+"|"+y+"|"+z+"|:");
    fill(255);
    rect(x,y,5,5);
     
  }
}
