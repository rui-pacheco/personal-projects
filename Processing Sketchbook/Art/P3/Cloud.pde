class Cloud{
	float x,y;
	java.awt.Polygon p;
	int vel;
	float xoff=40;

	Cloud(){
		x=random(-width+1,width-1);
		y=(height/4)+random(-40,40);

		vel=(int)random(-2,2);
		if (vel==0) {
			vel=-1;
		}
		p = new java.awt.Polygon();
		p.addPoint(0,0);
		for (int i = 0; i < 60 ; i+=10) {
			xoff+=20;
			int v =(int) map (noise(xoff),0,1,0,30);
			p.addPoint(i,v);
		}
		for (int i = 59; i >= 0 ; i-=10) {
			xoff+=20;
			int v =(int) map (noise(xoff),0,1,0,30);
			p.addPoint(i,-v);
		}
		p.addPoint(0,0);


	}

	void show(){
		pushMatrix();
		translate(x, y);
		fill(255);
		stroke(0);
		beginShape();

		for (int i = 1; i < p.npoints; ++i) {
			curveVertex(p.xpoints[i],p.ypoints[i]);
		}
		endShape(CLOSE);
		popMatrix();
		x+=vel;

		if(x>width){
			x=0;
		}
		if(x<0){
			x=width;
		}
	}
}