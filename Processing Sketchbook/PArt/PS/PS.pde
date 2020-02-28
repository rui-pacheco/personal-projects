Particle p ;
ArrayList<Particle> ps;
Connector c;
ArrayList<Connector> cs;
Particles particles;
ArrayList<Particles> psal;
TDate data;

void setup(){
  size(360,640);
  ps = new ArrayList <Particle>();
  cs = new ArrayList <Connector>();
  psal = new ArrayList<Particles>();
  data= new TDate();
  
  for ( int i = 0; i<50;i++){
    ps.add(new Particle());
    
  }
  particles= new Particles(ps,cs);
  
}

void draw(){
  background(0);
  particles.run();
  data.display();
  data.update();
  }
    
    
    //cs.get(9).connect(ps.get(9),ps.get(0)); 
    
    
   
  
  
  
  
