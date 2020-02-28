class Particles{
  ArrayList<Particle> ps;
  ArrayList<Connector> cs;
  int y;
  Light l = new Light();
  
  Particles(ArrayList<Particle> ps,ArrayList<Connector> cs){
    this.ps=ps;
    this.cs=cs;
  }
  
  
  void run(){
    for(int i=0; i<ps.size(); i++){
      //print(" "+ps.get(i).getLoc().x+" ");
      ps.get(i).display();
      l.display();
      ps.get(i).update();
      //ps.get(i).display();
      if(i!=ps.size()-1){
        //cs.add(new Connector((ps.get(i)),ps.get(i+1)));
      }else {
        //cs.add(new Connector((ps.get(i)),ps.get(0)));
      }
    }
  }
}
