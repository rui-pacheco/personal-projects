class Ground{
	ArrayList<Float> points;
	float xoff=0.00;
	float c=200;
	float y_altitude;
	java.awt.Polygon p;

	Ground(float y){
		y_altitude=y;
		p = new java.awt.Polygon();
		p.addPoint(0,height);
		for (int i = 1; i < width-1 ; ++i) {
			xoff+=5;
			int v =(int) map (noise(xoff),0,1,50*y_altitude/51,y_altitude);
			p.addPoint(i,v);
		}
		p.addPoint((int)width,(int)height);
		p.addPoint(0,(int)height);


	}


	void show(){
		pushMatrix();
		colorMode(RGB);	
		fill(155,118,83);
		stroke(0, 102, 0);
		strokeWeight(1);
		strokeJoin(BEVEL);
		beginShape();
		/*
		vertex(0, y_altitude);
		for (int i = 1; i < width-1; ++i) {
			vertex(i, points.get(i));
		}
		vertex(width, y_altitude);
		*/

		for (int i = 1; i < p.npoints; ++i) {
			vertex(p.xpoints[i],p.ypoints[i]);
		}
		endShape(OPEN);
		popMatrix();
	}

	boolean checkInside(float x, float y){
		return p.contains(x,y);
	}

	
}