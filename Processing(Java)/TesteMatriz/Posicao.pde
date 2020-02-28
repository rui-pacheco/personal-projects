class Posicao{
  Body body;
  Vec2 pos;
  float r=2.5;
  
  Posicao(int x , int y){
    pos = new Vec2( x,y);
    
      BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(pos.x,pos.y));
    body = box2d.createBody(bd);

    
   
    
    
    CircleShape ps = new CircleShape();
   
    float box2dX = box2d.scalarPixelsToWorld(pos.x);
    float box2dY = box2d.scalarPixelsToWorld(pos.y);
    ps.m_p.set(box2dX,box2dY);
    ps.m_radius=r;
    
   
    
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    body.createFixture(fd);
  }
  
  Vec2 getVector(){
    return pos;
  }
  
  void display(){
    
    
  
    Vec2 posi = box2d.getBodyPixelCoord(body);
    
    float a = body.getAngle();

    pushMatrix();
    translate(posi.x,posi.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(175);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(0,0,r*2,r*2);
    popMatrix();
    
    
  }
  }
  
