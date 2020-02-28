Ground g;
Tree[] t;
void setup() {
	g=new Ground(2*height/3);
	size(600,600);

	t = new Tree[5];
	for (int i = 0; i < t.length; ++i) {
		t[i]= new Tree(new PVector(random(0,width),2*height/3));
	}
}

void draw() {
	background(135,206,250);
	g.show();

	for (int i = 0; i < t.length; ++i) {
		if(g.checkInside(t[i].location.x,t[i].location.y)){
			t[i].run();
		}
	}
}