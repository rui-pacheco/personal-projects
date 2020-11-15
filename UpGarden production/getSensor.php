<?php 	 
ini_set("display_errors", "1");
error_reporting(E_ALL);
header('Access-Control-Allow-Origin: *');
include "PhpSerial.php";
// Let's start the class
$serial = new PhpSerial1();
// First we must specify the device. This works on both Linux and Windows (if
// your Linux serial device is /dev/ttyS0 for COM1, etc.)
$serial->deviceSet("COM6");
// Set for 9600-8-N-1 (no flow control)
$serial->confBaudRate(115200); //Baud rate: 9600
$serial->confParity("none");  //Parity (this is the "N" in "8-N-1")
$serial->confCharacterLength(8); //Character length     (this is the "8" in "8-N-1")
$serial->confStopBits(1);  //Stop bits (this is the "1" in "8-N-1")
$serial->confFlowControl("none");
// Then we need to open it
$serial->deviceOpen();
// Read data
//$read = $serial->readPort();
// Print out the data
//$data = preg_split('/\s+/', $read);
//print_r($data); // red and split the data by spaces to array
//$array = array_count_values($data); // count the array values
//$values = array_keys($array, max($array)); // count the maximum repeating value
//echo $values[0];
// If you want to change the configuration, the device must be closed.
$serial->deviceClose();?>