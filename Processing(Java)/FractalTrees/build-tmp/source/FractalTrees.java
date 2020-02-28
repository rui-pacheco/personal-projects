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

public class FractalTrees extends PApplet {


Tree[] t;

public void setup(){
	
	t = new Tree[10];
	for (int i = 0; i < t.length; ++i) {
		t[i]= new Tree(new PVector(random(0,width),random(0,height)));
	}
	
	

}

public void draw(){
	background(200);
	for (int i = 0; i < t.length; ++i) {
		t[i].run();
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
		stroke(0,110,0);
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
class Tree{
	ArrayList<Branch> branches = new ArrayList<Branch>();
	Branch b;
	int treeSize=8;
	int aj=0;

	PVector location;


	Tree(PVector loc){
		location=loc;

		float size = map(location.y,0,height,10,50);

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
  public void settings() { 	size(800,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FractalTrees" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
