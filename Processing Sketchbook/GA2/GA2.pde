PVector target;
int popmax;
float mutationRate;
Population population;
Ball[] bolas;
PVector locInicial;
void setup() {
  size(640, 360);
  target= new PVector(width/2,0);
  bolas= new Ball[10];
  for(int i = 0,  x= 10 ; i<bolas.length;i++,x+=10){
    bolas[i] = new Ball(new PVector(height-20,x));
  }
  
  popmax = 10;
  mutationRate = 0.01;
  

  // Create a populationation with a target phrase, mutation rate, and populationation max
  population = new Population(target, mutationRate, popmax);
}

void draw() {
  background(255);
  if (mousePressed){
   // Calculate fitness
  population.calcFitness();
  // Generate mating pool
  population.naturalSelection();
  //Create next generation
  population.generate();
   
  
}
 for(int i=0,x=0;i<bolas.length&&x<population.getPopul().length;){
  bolas[i].applyForces(population.getPopul()[x].getGenes());
  pushMatrix();
  bolas[i].display();
  popMatrix();
  //println(population.getPopul()[1].getGenes());
  
}

  
  //displayInfo();
  
  

  // If we found the target phrase, stop
  if (population.finished()) {
    println(millis()/1000.0);
    noLoop();
  }
}

void displayInfo() {
  background(255);
  // Display current status of populationation
  String answer = population.getBest();
  //textFont(f);
  textAlign(LEFT);
  fill(0);
  
  
  textSize(24);
  text("Best phrase:",20,30);
  textSize(40);
  text(answer, 20, 100);

  textSize(18);
  text("total generations:     " + population.getGenerations(), 20, 160);
  text("average fitness:       " + nf(population.getAverageFitness(), 0, 2), 20, 180);
  text("total population: " + popmax, 20, 200);
  text("mutation rate:         " + int(mutationRate * 100) + "%", 20, 220);
 
  textSize(10);
  text("All phrases:\n" + population.allPhrases(), 500, 10);
}
