import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class P4 extends PApplet {

Ground g;
Tree[] t;
public void setup() {
	g=new Ground(2*height/3);
	

	t = new Tree[5];
	for (int i = 0; i < t.length; ++i) {
		t[i]= new Tree(new PVector(random(0,width),2*height/3));
	}
}

public void draw() {
	background(135,206,250);
	g.show();

	for (int i = 0; i < t.length; ++i) {
		if(g.checkInside(t[i].location.x,t[i].location.y)){
			t[i].run();
		}
	}
}
class Branch{
	PVector loc_begin;
	PVector loc_end;
	boolean complete=false;

	Branch(PVector a, PVector b){
		loc_begin=a;
		loc_end=b;
	}



	public void display(){
		colorMode(RGB);
		stroke(0,0,0);
		strokeWeight(0.5f);
		pushMatrix();
		line(loc_begin.x,loc_begin.y,loc_end.x,loc_end.y);
		popMatrix();
	}

	public void update(){
		loc_begin.x+=random(-0.01f,0.01f);
		loc_begin.y+=random(-0.01f,0.01f);
		loc_end.x+=random(-0.01f,0.01f);
		loc_end.y+=random(-0.01f,0.01f);

	}


	public ArrayList <Branch> createBranch(){
		//println("loc_newEnd1: "+loc_end.x+" : "+loc_end.y);
		PVector dir1 =PVector.sub(loc_end,loc_begin);
		PVector dir2 =PVector.sub(loc_end,loc_begin);
		//println("loc_newEnd1: "+loc_end.x+" : "+loc_end.y);
		//println("loc_newEnd1: "+dir1.x+" : "+dir1.y);
		dir1.rotate(random(PI/4,PI/5));
		dir1.mult(0.67f);
		PVector loc_newEnd1 = PVector.add(loc_end,dir1);
		Branch branch_a = new Branch(this.loc_end,loc_newEnd1);
		
		dir2.rotate(random(-PI/4,-PI/5));
		dir2.mult(0.67f);
		PVector loc_newEnd2 = PVector.add(loc_end,dir2);
		Branch branch_b = new Branch(this.loc_end,loc_newEnd2);

		ArrayList<Branch> bs = new ArrayList<Branch>() ;
		bs.add(branch_a);
		bs.add(branch_b);
		complete=true;

		
		//println("loc_newEnd2: "+loc_newEnd2.x+" : "+loc_newEnd2.y);
		
		return bs;

	}

	public boolean getComplete(){
		return complete;

	}

}
class Ground{
	ArrayList<Float> points;
	float xoff=0.00f;
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


	public void show(){
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

	public boolean checkInside(float x, float y){
		return p.contains(x,y);
	}

	
}
class Tree{
	ArrayList<Branch> branches = new ArrayList<Branch>();
	Branch b;
	int treeSize=6;
	int aj=0;

	PVector location;


	Tree(PVector loc){
		location=loc;

		float size = map(location.y,0,height,5,20);

		b=new Branch(loc,new PVector(location.x,location.y-size));
		branches.add(b);
		
	}

	public void run(){
		if (aj<treeSize) {
			for (int i = branches.size()-1; i >=0  ; --i) {
				if (branches.get(i).getComplete()==false) {
					branches.addAll(branches.get(i).createBranch());
				}
			}
			aj++;
		}
		for (int i = 0; i < branches.size() ; ++i) {
			branches.get(i).display();
			branches.get(i).update();
		}
	}
}
  public void settings() { 	size(600,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "P4" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
