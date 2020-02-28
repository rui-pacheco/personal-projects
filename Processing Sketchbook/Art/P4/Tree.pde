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

	void run(){
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