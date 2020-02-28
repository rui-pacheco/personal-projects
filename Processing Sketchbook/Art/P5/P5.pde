int[] valor;
void setup() {
	size(400,600);

	valor= new int[20];
	for (int i = 0; i < valor.length; ++i) {
		valor[i]=(int)random(0, 2);
	}

	printArray(valor);
	printArray(applyRules(valor));


}

void draw() {
	
}

int[] applyRules(int[] v){
	int[] result = new int[20];
	result[0]=v[0];
	for (int i = 1; i < v.length-1; ++i) {
			int[] f = {v[i-1],v[i],v[i+1]};
			printArray(f);
		switch (f) {
			case (0,0,0) : result[i]=0; 
				
			break;

			case (0,0,1) : result[i]=1; 
				
			break;

			case (0,1,0) : result[i]=1; 
				
			break;

			case (0,1,1) : result[i]=0; 
				
			break;	

			case (1,0,0) : result[i]=1; 
				
			break;

			case (1,0,1) : result[i]=1; 
				
			break;		

			case (1,1,0) : result[i]=0; 
				
			break;		

			case (1,1,1) : result[i]=1; 
				
			break;							
		}
		result[i]=v[i];
	}
	result[19]=v[19];

	return result;
}
