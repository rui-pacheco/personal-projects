ArrayList<String> instructions;
float len= 500;
float c=0;
int count=0;
int auxCount=0;
float auxN=0;

void setup(){
	
	float  w,h;
	w=1080*0.4;
	h=1920*0.4;
	background(50);
	//size(1080,1920);~~
	//size(800,800);
	size(345,641);
	instructions=new ArrayList<String>();
	instructions.add("A");
	for (int i = 0; i < 30; ++i) {
		applyRule();
	}

	//frameRate(4);
	
}

void draw(){
	pushMatrix();
	background( 50);
	translate(0,height/2);
	
	colorMode(HSB);
	auxN = map(sin(auxCount),-1,1,150,255);
	stroke(c,150,auxN,auxN);
	
	for (float i = len; i >= 20; i*=0.8) {
		runRules(i);
	}
	
	
	
	auxCount +=0.01;
   popMatrix();
	
	

}

void applyRule(){
	
		switch(instructions.get(instructions.size()-1)){
			case "A" : {
			//instructions.add("A");
			instructions.add("A");
			instructions.add("B");
			}
			break;
			case "B" :{instructions.add("A");}
			break ;


}

}

void mousePressed(){
	save("LWallpaper.jpg");

}

void runRules(float l){
	c+=5;
	//pushMatrix();
	
		
	
	
	for (int i = 0; i <instructions.size() ; ++i) {
		switch (instructions.get(i)) {
			case("A"):{
				rotate(PI/6);
				line(0,0,0,-l);
				translate(0, -l);
			}
				break;
			case ("B"):{
				rotate(-PI/6);
				line(0,0,0,-l);
				translate(0, -l);}
				break;
				}

			}

			//len*=0.90;
			//popMatrix();

		}