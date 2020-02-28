class Chao{
  
  Body body;
  ArrayList<Vec2> vertices;
  ArrayList<Vec2> surface;
  
  Chao(){
    surface = new ArrayList<Vec2>();
    // Here we keep track of the screen coordinates of the chain
    
   /* surface.add(new Vec2(0+xs, height/2+ys));
    surface.add(new Vec2(0+xs, 6*height/8+ys));
    surface.add(new Vec2(height/7+xs, 6*height/8+ys));
    surface.add(new Vec2(height/7+xs, height/2+ys));*/
    surface.add(new Vec2(0, height));
    surface.add(new Vec2(width, height));
   
  
  
  
  
  
  
  ChainShape ps = new ChainShape();
  
   Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }
    
  ps.createChain(vertices,vertices.length);

  
  BodyDef bd = new BodyDef();
  bd.type = BodyType.STATIC;
  body = box2d.createBody(bd);
  
  body.createFixture(ps,1);
  
  }
  
  void display(){
  pushMatrix();
     strokeWeight(1);
    stroke(0);
    fill(0,20);
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x, v.y);
    }
    //vertex(width, height);
    //vertex(0, height);
    endShape(OPEN);
    popMatrix();
  }


}
