<?php


$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = 'root';
$dbname = 'upgardentest';
$conn = mysqli_connect($dbhost, $dbuser, $dbpass,$dbname);
$q = ($_GET['q']);

if(! $conn ) {
	die('Could not connect: ' . mysqli_error());
}

$sql = "SELECT id, data, hora, valor FROM ".$q." WHERE falerta=1";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
	while($row = $result->fetch_assoc()) {
		echo "<tr><td> " . $row["id"]. " </td><td> " . $row["data"]. " </td><td>" . $row["hora"]. "</td><td> " . $row["valor"]. "</td></tr>";
	} echo "</table>";
} else {
	echo "0 results";
}

//$sqladd ="INSERT INTO humidade (data,hora,valor) Values(CURDATE,CURTIME,rand())";
$conn->close();
?>