class Sqr{
	float x;
	float y;
	float h,u,e;
	float w,l;

	Sqr(float a, float b){
		x=a+random(-1,1);
		y=b+random(-1,1);
		w=random(10,11);
		l=random(10,11);


	}

	void show(){
		rectMode(CENTER);
		rect(x,y,w,l);
	}


}