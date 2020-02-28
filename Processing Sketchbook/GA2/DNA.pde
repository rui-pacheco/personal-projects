class DNA {

  // The genetic sequence
  PVector[] genes;
  
  float fitness;
  
  // Constructor (makes a random DNA)
  DNA() {
    genes = new PVector[10];
    for(int i = 0 ; i<genes.length;i++){
      genes[i]=new PVector(random(-20,20),random(-20,20));
    }
  
  }
  

  void fitness (PVector target) {
    int score = 0;
    float d=0;
    PVector total=new PVector(0,0);
    for (PVector g : genes){
    total.add(g);}
    d = total.dist(target)+d;
        
    score=(int)map(d,0,height,0,100);
    
    fitness = (float)score / 100;
    println(d);
  }
  
  PVector[] getGenes(){
    return genes;
  }
  
    
  
  // Crossover
  DNA crossover(DNA partner) {
    // A new child
    DNA child = new DNA();
    
    int midpoint = int(random(genes.length)); // Pick a midpoint
    
    // Half from one, half from the other
    for (int i = 0; i < genes.length; i++) {
      if (i > midpoint) child.genes[i] = genes[i];
      else              child.genes[i] = partner.genes[i];
    }
    return child;
  }
  
  // Based on a mutation probability, picks a new random character
  void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = new PVector(random(-20,20),random(-20,20));
      }
    }
  }}
