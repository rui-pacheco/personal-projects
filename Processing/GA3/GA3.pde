int maxPop =10;
DNA[] population = new DNA[maxPop];
Bola[] bolas = new Bola[maxPop];
ArrayList<DNA> matingPool ;
float mutationRate=0.5;
int counter=0;
Drop[] Drops = new Drop[1000];

DNA best;

void setup(){
  size(600,600);
  for (int i = 0 ; i< Drops.length; i++){
    Drops[i]=new Drop();
  }
  for (int i= 0; i<maxPop;i++){
      population[i] = new DNA();
      bolas[i]=new Bola();
      
      
  }  
  
}

void draw(){
  
  background(0);
  text("Geração"+counter,50,30);
 
 for (int i = 0 ; i< Drops.length; i++){
    Drops[i].update();
    Drops[i].show();
  }
/* if(mousePressed){
 for (int i = 0; i < population.length; i++) {
  population[i].fitness();}
  getBest();
  background(best.getGenes()[0],best.getGenes()[1],best.getGenes()[2]);
    
    selection();
    reproduction();
    
     
  }*/}
  
void selection(){
    matingPool = new ArrayList<DNA>();
    
    for (int i = 0; i < population.length; i++) {
      
      int n = int(population[i].fitness * 100);
  //println(population[i]);
    for (int j = 0; j < n; j++) {
      
      matingPool.add(population[i]);
      
    }
    //println(matingPool);
  }
}

void reproduction(){
  for (int i = 0; i < population.length; i++) {
   int a = int(random(matingPool.size()));
   int b = int(random(matingPool.size()));
      
   DNA parentA = matingPool.get(a);
   DNA parentB = matingPool.get(b);
   
   DNA child = parentA.crossover(parentB);
   
   child.mutate();
    population[i] = child;
  }
}

DNA getBest(){
  float fit=0;
  for(int i =0;i<population.length;i++){
    if(population[i].fitness>fit){
      best=population[i];
      fit=population[i].fitness;
    }
  }
   println("Melhor Fitness: " + best.fitness);
  println(best.getGenes());
  return best;
}

void mouseClicked(){
  
  
 
  
  for (int i = 0; i < population.length; i++) {
    
    population[i].fitness();}
    getBest();
    for (int i = 0,k=0; i < population.length; i++,k+=((Drops.length)/maxPop)) {
      for(int j = 0+k; j <((Drops.length)/maxPop)+k;j++)
    Drops[j].setRGB(population[i].genes[0],population[i].genes[1],population[i].genes[2]);
    
  //bolas[i].display(population[i].genes[0],population[i].genes[1],population[i].genes[2]);
    //background(best.getGenes()[0],best.getGenes()[1],best.getGenes()[2]);
    }
    selection();
    reproduction();
    counter++;
}


  
