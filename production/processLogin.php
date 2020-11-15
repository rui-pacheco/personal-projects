<?php
// começar ou retomar uma sessão
session_start();
 
// se vier um pedido para login
if (!empty($_POST)) {
 
	// estabelecer ligação com a base de dados
	$conn=mysqli_connect('localhost', 'root', 'root','upgarden') or die(mysql_error());
	
 
	// receber o pedido de login com segurança
	$username = ($_POST['username']);
	$password = ($_POST['password']);
 
	// verificar o utilizador em questão (pretendemos obter uma única linha de registos)
	$login = $conn->query("SELECT id_client, username FROM cliente WHERE username = '$username' AND password = '$password'");
	//$login = mysql_query("SELECT id_client, username FROM cliente WHERE username = '$username' AND password = '$password'");
 
	if ($login->num_rows  == 1) {
 
		// o utilizador está correctamente validado
		// guardamos as suas informações numa sessão
		$_SESSION['id'] = mysqli_result($login, 0, 0);
		$_SESSION['username'] = mysqli_result($login, 0, 1);
 
		echo "<p>Sess&atilde;o iniciada com sucesso como {$_SESSION['username']}</p>";
	} else {
 
		// falhou o login
		echo "<p>Utilizador ou password invalidos. <a href=\"login.php\">Tente novamente</a></p>";
	}
}
?>