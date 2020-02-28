Mountain m,m1;
Tree[] t;
Cloud[] c;
Hut[] h;
void setup(){
	c=new Cloud[2];
	for (int i = 0; i < c.length; ++i) {
		c[i]= new Cloud();
	}
	//noiseSeed(3);
	//randomSeed(1);
	//m=new Mountain(2*height/3);
	t = new Tree[50];
	for (int i = 0; i < t.length; ++i) {
		t[i]= new Tree(new PVector(random(0,width),random(0,height)));
	}

	h=new Hut[10];
	for (int i = 0; i < h.length; ++i) {
		h[i]=new Hut(random(0,width),random(0,height));
	}

	m=new Mountain(height);
	//background(66, 244, 235);
	size(600,600);
	//m.show();
	
}
void draw(){

	pushMatrix();
	colorMode(RGB);
	background(66, 244, 235);
	//c.update();
	for (int i = 0; i < c.length; ++i) {
			c[i].show();	
	}
	m.show();
	//h.run();
	for (int i = 0; i < t.length; ++i) {
		if(m.checkInside(t[i].location.x,t[i].location.y)){
			t[i].run();
		}
	}

	for (int i = 0; i < h.length; ++i) {
		if(m.checkInside(h[i].x,h[i].y)){
			h[i].run();
		}
	}
	popMatrix();


	
}