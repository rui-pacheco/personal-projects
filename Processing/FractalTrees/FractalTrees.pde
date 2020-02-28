
Tree[] t;

void setup(){
	size(800,600);
	t = new Tree[10];
	for (int i = 0; i < t.length; ++i) {
		t[i]= new Tree(new PVector(random(0,width),random(0,height)));
	}
	
	

}

void draw(){
	background(200);
	for (int i = 0; i < t.length; ++i) {
		t[i].run();
	}
	

}

