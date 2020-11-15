
<?php
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = 'root';
$dbname = 'upgardentest';
$conn = mysqli_connect($dbhost, $dbuser, $dbpass,$dbname);

if(! $conn ) {
	die('Could not connect: ' . mysqli_error());
}

$sql = "SELECT * FROM humidade ORDER BY ID DESC LIMIT 1";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
	while($row = $result->fetch_assoc()) {
		echo ($row['valor']."%");
	}
} else {
	echo "0 results";
}
//echo($result['valor']);
$conn->close();
?>