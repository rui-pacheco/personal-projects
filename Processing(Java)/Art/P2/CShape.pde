class CShape{
	ArrayList<Float> points;
	float xoff=0.00;
	float c;


	CShape(){
		points=new ArrayList<Float>();
		float l = random(5,10);
		for (int i = 0; i < l ; ++i) {
			xoff+=10;
			float v = map (noise(xoff),0,1,0,width);
			points.add(v);
		}

	
	 c =random(0, 255);
	}


	void show(){
	colorMode(HSB);
	xoff+=0.5;
	//float bn=map(sin(xoff),0,1,0,255);
	fill(c,200,255,60);
	strokeWeight(0.5);
	//strokeJoin(BEVEL);
	//noStroke();
	beginShape();
	for (int i = points.size()-1; i > 0 ; i-=1) {
		vertex(points.get(i),points.get(i-1));
	}
		
    
    endShape(CLOSE);

	}

}