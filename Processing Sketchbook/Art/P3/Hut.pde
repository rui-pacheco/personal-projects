class Hut{
	float x,y,size;

	Hut(float x,float y){
		this.x=x;
		this.y=y;
		size = map(y,0,height,5,20);

	}

	void run(){
		pushMatrix();
			colorMode(RGB);
			fill(204, 102, 0);
			beginShape();
			vertex(x-size/2, y);
			vertex(x+size/2, y);
			vertex(x, y-size);
			endShape();
		popMatrix();

	}
}