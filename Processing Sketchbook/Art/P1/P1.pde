Sqr quadrados [] = new Sqr[100];

void setup(){
	int index =0;
	size(500,500);
	for (int i = 0; i <200; i+=20) {
		for (int j =0; j<200; j+=20) {
			
		
		quadrados[index] = new Sqr(i+width/3+random(0,5),j+height/3+random(0,5));
		index++;
	}
	}

}
void draw(){
background(50);
for (int i = 0; i < quadrados.length; ++i) {
		quadrados[i].show(); 
			}
}