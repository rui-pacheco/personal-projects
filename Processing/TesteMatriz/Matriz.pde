class Matriz{
  int x,y;
  ArrayList <Posicao> posicoes;
  
  
  Matriz(int k, int j){
    posicoes=new ArrayList();
    x=k;
    y=j;
    
   
  }
  
  
  void display(){
  
   for (int a=1 ,c=x ; a<=x;a++,c--){
     for(int b = 1;b<=y;b++){
      line(a*width/x,-height,a*width/x,height);
      line(-width,b*height/y,width,b*height/y);
      posicoes.add(new Posicao(c*width/x,b*height/y));
    }
    }
    /*for (int a = 1 ; a<=y;a++){
      line(-width,b*height/y,width,b*height/y);
    }*/
  }
  
  ArrayList<Posicao> getPosicoes(){
    return posicoes;
  }
}
