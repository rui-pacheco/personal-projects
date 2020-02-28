CShape[] formas;
void setup(){
	//noiseSeed(3);
	//randomSeed(1);
	background(255);
	size(600,600);
	formas=new CShape[50];
	for (int i = 0; i < formas.length; ++i) {
		formas[i]=new CShape();
	}
	for (CShape forma : formas) {
		forma.show();
	}

}
void draw(){
	


	
}