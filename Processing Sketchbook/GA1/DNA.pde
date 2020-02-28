// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Genetic Algorithm, Evolving Shakespeare

// A class to describe a psuedo-DNA, i.e. genotype
//   Here, a virtual organism's DNA is an array of character.
//   Functionality:
//      -- convert DNA into a string
//      -- calculate DNA's "fitness"
//      -- mate DNA with another set of DNA
//      -- mutate DNA


class DNA {

  // The genetic sequence
  Pix[] genes;
  
  float fitness;
  
  // Constructor (makes a random DNA)
  DNA(int num) {
    genes = new Pix[num];
    for (int i = 0; i < genes.length; i++) {
      genes [i] = new Pix(); // Pick from range of chars
    }
  }
  
  // Converts character array to a String
 // String getPhrase() {
 //   return new String(genes);
 // }
  
  // Fitness function (returns floating point % of "correct" characters)
  void fitness (PImage target) {
    target.loadPixels();
    int score = 0;
     for (int y = 0; y < height; y++) {
       for (int x = 0; x < width; x++) {
         int loc = x + y*width;
        if(genes[loc].r-red(pixels[loc])<=50){
           score+=0.5; 
          }else if(genes[loc].r-red(pixels[loc])<=25){
            score++;
          }
        }
        }
 
     //for (int i = 0; i < genes.length; i++) {
     //   if (genes[i] == target.charAt(i)) {
      //    score++;
      //  }
     
  
     fitness = (float)score / (float)width*height.length();
  }
  
     void comparePixels(){
          
        }
  
  // Crossover
  DNA crossover(DNA partner) {
    // A new child
    DNA child = new DNA(genes.length);
    
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
        genes[i] = (char) random(32,128);
      }
    }
  }
}
