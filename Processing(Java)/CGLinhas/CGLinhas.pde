Linha l ;
void setup(){
	background(0);
	
	l=new Linha(0,height/2,width,height/2);
	size(400,600);
}
void draw(){

	l.display();
	l.update();
}