Ball[] balls = new Ball[2];
BallGroup bg = new BallGroup();
void setup() {
    size(500,500);
    
}

void draw() {
    background(0);
    for (int i = 0; i < balls.length; ++i) {
        balls[i].show();
    }

    
    
}
