class Branch{
	PVector loc_begin;
	PVector loc_end;
	boolean complete=false;

	Branch(PVector a, PVector b){
		loc_begin=a;
		loc_end=b;
	}



	void display(){
		colorMode(RGB);
		stroke(0,0,0);
		strokeWeight(1);
		pushMatrix();
		line(loc_begin.x,loc_begin.y,loc_end.x,loc_end.y);
		popMatrix();
	}

	void update(){
		loc_begin.x+=random(-0.01,0.01);
		loc_begin.y+=random(-0.01,0.01);
		loc_end.x+=random(-0.01,0.01);
		loc_end.y+=random(-0.01,0.01);

	}


	ArrayList <Branch> createBranch(){
		//println("loc_newEnd1: "+loc_end.x+" : "+loc_end.y);
		PVector dir1 =PVector.sub(loc_end,loc_begin);
		PVector dir2 =PVector.sub(loc_end,loc_begin);
		//println("loc_newEnd1: "+loc_end.x+" : "+loc_end.y);
		//println("loc_newEnd1: "+dir1.x+" : "+dir1.y);
		dir1.rotate(random(PI/4,PI/5));
		dir1.mult(0.67);
		PVector loc_newEnd1 = PVector.add(loc_end,dir1);
		Branch branch_a = new Branch(this.loc_end,loc_newEnd1);
		
		dir2.rotate(random(-PI/4,-PI/5));
		dir2.mult(0.67);
		PVector loc_newEnd2 = PVector.add(loc_end,dir2);
		Branch branch_b = new Branch(this.loc_end,loc_newEnd2);

		ArrayList<Branch> bs = new ArrayList<Branch>() ;
		bs.add(branch_a);
		bs.add(branch_b);
		complete=true;

		
		//println("loc_newEnd2: "+loc_newEnd2.x+" : "+loc_newEnd2.y);
		
		return bs;

	}

	boolean getComplete(){
		return complete;

	}

}