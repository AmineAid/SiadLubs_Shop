 <?php
 include_once("database_connection.php");
$a = "'efekfekéé'é'é'";
$new = htmlspecialchars($a);
$b=mysqli_real_escape_string($dbc,$a);
echo $new; // &lt;a href=&#039;test&#039;&gt;Test&lt;/a&gt;
echo"<br>&eacute;";
echo $b;
            ?>