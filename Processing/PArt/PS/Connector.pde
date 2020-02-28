class Connector{
  Particle p1;
  Particle p2;
  
  Connector(Particle pp1, Particle pp2){
      pushMatrix();
      stroke(255);
      translate(width/2,height/2);
      p1 = pp1;
      p2 = pp2;
      line(p1.getLoc().x, p1.getLoc().y,p2.getLoc().x,p2.getLoc().y);
      popMatrix();}
    
 /* void connect(Particle pp1, Particle pp2){
    
      pushMatrix();
      stroke(255);
      translate(width/2,height/2);
      p1 = pp1;
      p2 = pp2;
      line(p1.getLoc().x, p1.getLoc().y,p2.getLoc().x,p2.getLoc().y);
      popMatrix();
    
}*/


}
