 <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/img.jpg" alt="">John Doe
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li id="profile" onClick="open_page(this.id)"><a> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>



                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">1</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a >
                        <span class="glyphicon glyphicon-alert"></span>
                        <span>
                          <span>Humidade</span>
                          <?php


$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = 'root';
$dbname = 'upgardentest';
$conn = mysqli_connect($dbhost, $dbuser, $dbpass,$dbname);

if(! $conn ) {
  die('Could not connect: ' . mysqli_error());
}

//echo 'Connected successfully<br>';
$sql = "SELECT id, data, hora, valor FROM humidade WHERE falerta=1";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "<span class='time'>".$row["hora"]. "do dia".$row["data"]."</span></span> " ;
  } 
} else {
  echo "0 results";
}

//$sqladd ="INSERT INTO humidade (data,hora,valor) Values(CURDATE,CURTIME,rand())";
$conn->close();
?>
                          
                         
                        <span class="message">
                          Atencão, a humidade ultrapassa o nivel recomendado.
                        </span>
                      </a>
                    </li>
                   
                    </li>
                
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>