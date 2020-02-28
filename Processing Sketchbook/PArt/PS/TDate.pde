class TDate{
  int day;
  int month;
  int year;
  
  
  int hour;
  int minute;
  int second;
  
  TDate(){
    day=day();
    month=month();
    year=year();
    
    hour=hour();
    minute=minute();
    second = second();
    
  }
  
  void display(){
    pushMatrix();
    text(String.valueOf(day)+" - "+String.valueOf(month)+" - "+String.valueOf(year), 10, 30);
    text(String.valueOf(hour)+" : "+String.valueOf(minute)+" : "+String.valueOf(second), 10, 60);
    popMatrix();
  }
  
  void update(){
     day=day();
    month=month();
    year=year();
    
    hour=hour();
    minute=minute();
    second=second();
  }
}
