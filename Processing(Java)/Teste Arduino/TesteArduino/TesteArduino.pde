import processing.serial.*;
Serial myPort; 
String val; 
float valor;

void setup(){
String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 115200);
  size(400,400);
  
  
  
}
void draw(){
if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n'); 
  valor=map(Float.parseFloat(val),0,100,0,255);
  colorMode(HSB);
  background(valor,100,100);
  // read it and store it in val
  } 
  
println(val); //print it out in the console
}
