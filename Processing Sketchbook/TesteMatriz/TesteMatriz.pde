import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Posicao> posicoes;
Matriz m;
void setup(){
  background(255);
  size(400,400);
  m = new Matriz(30,30);
  posicoes = m.getPosicoes();
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  //box2d.setGravity(0,-10);
}

void draw(){
  box2d.step();
  
  m.display();
  for(int i=0; i< posicoes.size() ;i++){
     posicoes.get(i).display();
     
  }
  
  
}
