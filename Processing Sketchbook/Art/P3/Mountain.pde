class Mountain{
	ArrayList<Float> points;
	float xoff=0.00;
	float c=200;
	float y_altitude;
	java.awt.Polygon p;

	Mountain(float y){
		y_altitude=y;
		p = new java.awt.Polygon();
		p.addPoint(0,(int)y_altitude);
		for (int i = 1; i < width-1 ; ++i) {
			xoff+=0.005;
			int v =(int) map (noise(xoff),0,1,0,y_altitude);
			p.addPoint(i,v);
		}
		p.addPoint(width,(int)y_altitude);
		p.addPoint(0,(int)y_altitude);


	}


	void show(){
		pushMatrix();
		colorMode(RGB);	
		fill(255,255,255);
		stroke(0);
		strokeWeight(0.5);
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