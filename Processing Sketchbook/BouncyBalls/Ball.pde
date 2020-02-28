class Ball{
  PVector force ;
  Vec2 f2D;
  float angle, angleVel=0.1;
  Body body;
  float x,y;
  float radius=width/35;
  
  Ball(float xa, float ya){
    force=new PVector();
    angle = random(0,2*PI);
    x=xa;
    y=ya;
  }
  
  void run(){
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    bd.fixedRotation=true;
    body = box2d.createBody(bd);
    
    //bdef=bd;
    
   
    
    
    CircleShape cs = new CircleShape();
    //float box2dX = box2d.scalarPixelsToWorld(x);
    //float box2dY = box2d.scalarPixelsToWorld(y);
    //cs.m_p.set(box2dX,box2dY);
    cs.m_radius=box2d.scalarPixelsToWorld(radius);
    
   
    
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
    fd.density = 0.5;
    fd.friction = 0.1;
    fd.restitution = 0.1;
    
    body.createFixture(fd);
    
    
    
    
    
    
    
    
    
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    
    
    force=force.fromAngle(angle);
    
    force.setMag(10);
    
     f2D = new Vec2(force.x,-force.y);
    angle+=angleVel;
    
  
   
   
    
    pushMatrix();
    translate(pos.x,pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(50);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(0,0,radius*2,radius*2);
    translate(force.x,force.y);
    fill(150);
    ellipseMode(CENTER);
    ellipse(0,0,5,5);
    popMatrix();
    

  
    /*pushMatrix();
    translate(force.x,force.y);
    fill(50);
    ellipseMode(CENTER);
    ellipse(0,0,5,5);
    popMatrix();*/
  }
  
  void update(){
    angleVel=0.1;
    
  }
  
  void applyForce(Vec2 force){
      Vec2 pos = body.getWorldCenter();
      body.applyForce(force,pos);
  }
  
  void move(){
    
      angleVel=0;
      applyForce(f2D);
  }
  
  void resetVel(){
    angleVel=0.1;
  }
  
  
}
