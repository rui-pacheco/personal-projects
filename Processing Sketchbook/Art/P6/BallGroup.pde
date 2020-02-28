public class BallGroup  {
    Ball [] bolas;
    int nrBolas=50;


    public BallGroup () {
        for(int i = 0; i < nrBolas; ++i){
            bolas[i]=new Ball();
         }
    }

  void show(){
      for(int i = 0; i < nrBolas; ++i){
            bolas[i]=new Ball();
         }
  }

}
