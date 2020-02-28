class Particula {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int r = 50;
  int flag = 0; //0 = a diminuir   1= a crescer Mag
  float cor ;



  Particula(int x) {
    location = new PVector(x, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    location.y=sqrt((r*r)-(location.x*location.x));
    cor=random(0,255);
  }
  void update() {
    //location.y=sqrt((location.magSq())-(location.x*location.x));
    float tamanho=location.mag();
    if (tamanho>random(20,40) && flag==0) {

      location.setMag(tamanho-0.2);
      
    } else 
    if (tamanho<=random(20,40) && flag==0) {
      flag=1;
      location.setMag(tamanho+0.2);
      //print(" V1: "+tamanho+" . ");
      
    } else 
      if (tamanho>=random(60,80) && flag==1) {
      location.setMag(tamanho-0.2);
     // print(" V1: "+tamanho+" . ");
      flag=0;
    } else 
    if (tamanho>=random(20,50) && flag==1) {
      
      location.setMag(tamanho+0.2);
      
    }
  }

  void show () {

    
    fill(cor);
    line(0,0,location.x, location.y);
    line(0,0,location.x, -location.y);
    ellipse(location.x, location.y, 5, 5);
    ellipse(location.x, -location.y, 5, 5);
  }
}
