int nivelFib=9;
int j=0;

Quadrado [] quadrados = new Quadrado[1000];

void setup(){
  
  size(800,800);
  for (int i = 0 ; i<= total(nivelFib);i++){
    quadrados[i]=new Quadrado(nivelFib);
  }

}

void draw(){
  background(0);
  
  //print("Valor Total: "+total(6)+" ");
   while(j<total(nivelFib)){
     print("Valor J: "+j+" ");
     quadrados[j].show();
     quadrados[j].update();
     j++;
   }
  

}

int fibo(int n){ 
  if (n <= 1) {
    return n;
  }
  else
  {
    return fibo(n-1) + fibo(n-2);
  } 
  }
  
  
int total(int n){
    if (n <= 1) {
    return n;
  }
  else
  {
    return fibo(n) + fibo(n-1);
  } 
}  
