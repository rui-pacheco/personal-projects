<?php


$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = 'root';
$dbname = 'upgardentest';
$conn = mysqli_connect($dbhost, $dbuser, $dbpass,$dbname);
$db = ($_GET['db']);
$humidade=($_GET['humidade']);
$press=($_GET['press']);
$vent=($_GET['vent']);
$temp=($_GET['temp']);

$data = ($_GET['data']);
$hora = ($_GET['hora']);

if(! $conn ) {
	die('Could not connect: ' . mysqli_error());
}

echo 'Connected successfully<br>'.$q;
$sql = "Insert ".$data."," .$hora.",".$humidade.",".$press.",".$vent.",".$temp." INTO ".$db;
$result = $conn->query($sql);



//$sqladd ="INSERT INTO humidade (data,hora,valor) Values(CURDATE,CURTIME,rand())";
$conn->close();
?>