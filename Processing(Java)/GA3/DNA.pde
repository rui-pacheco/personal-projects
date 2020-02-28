class DNA{
  float[] genes = new float[3];
  float[] target = {200,25,14} ;
  float fitness;
  
  
  DNA(){
    for (int i= 0; i<genes.length;i++){
      genes[i] = random(0,255);
    }
  }
  
  
  void fitness(){
    float score= 0;
    for (int i= 0; i<genes.length;i++){
      float d = 255 - abs(target[i]-genes[i]);
      score = score +d;
    }
    fitness = score;
    
  }
  
  DNA crossover(DNA partner){
    
  float[] diffTargetP1=new float[genes.length];
  float[] diffTargetP2=new float[genes.length];
  DNA child = new DNA();
  for(int i = 0; i<genes.length;i++){
    diffTargetP1[i]=abs(target[i]-genes[i]);
    diffTargetP2[i]=abs(target[i]-partner.genes[i]);}
  
  for(int i = 0; i<genes.length;i++){
    if(diffTargetP1[i]<diffTargetP2[i]){
    child.genes[i]=genes[i];}else{child.genes[i]=partner.genes[i];}
  }
    
  
  return child;
}

 void mutate(){
   for(int i = 0; i<genes.length;i++){
     if(random(1)<mutationRate){
       int j =(int)random(-5,5);
       if(genes[i]+j<=255&&genes[i]+j>=0){
       genes[i] +=j; }
     }
   }
 }
 float[] getGenes(){
   return genes;
 }
 
}
