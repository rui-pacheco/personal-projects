public class Ball {
    int x;
    int y;
    int vel;
    int r;
    public Ball () {
        x=(int)random(0, width);
        y=(int)random(0,height);
        r=5;
    }

    void show(){
        pushMatrix();
        fill(255);
        ellipse(x, y,r ,r );
        popMatrix();
    }

    double getDistance(Ball ball){
        double ac = Math.abs(ball.y - this.y);
        double cb = Math.abs(ball.x - this.x); 
        return Math.hypot(ac, cb);
    }

}
