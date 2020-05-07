<?php 
Session_start();
if (isset($_SESSION['lg']) AND $_SESSION['lg']==2){
session_unset ();  
session_destroy();
setcookie("lg", 5, time()-3600);
echo'<script type="text/javascript">window.top.location.reload();</script>';
}
if (isset($_POST['password']) AND $_POST['password']=="Siad"){
	$_SESSION['lg'] = 2;
	if(isset($_GET['page'])){
		$page=$_GET['page'];
		if(isset($_GET['parameter1'])){
			$parameter1=$_GET['parameter1'];
			$value1=$_GET['value1'];
	echo '<SCRIPT LANGUAGE="JavaScript">
document.location.href="'.$page.'.php?'.$parameter1.'='.$value1.'";
</SCRIPT>';
		}else{
				echo '<SCRIPT LANGUAGE="JavaScript">
document.location.href="'.$page.'.php";
</SCRIPT>';
		}
	}else{
echo'<script type="text/javascript">window.top.location.reload();</script>';
}
}else{
?>
<html><head>
<link href="css/style2.css" type="text/css" rel="stylesheet"/>
</head>
<div align="center">
	
		<?php
		if(isset($_GET['page'])){
			$page=$_GET['page'];
		if(isset($_GET['parameter1'])){
			$parameter1=$_GET['parameter1'];
			$value1=$_GET['value1'];

			echo "<form method='post' action='?parameter1=$parameter1&value1=$value1&page=$page'>";
		}else{
echo "<form method='post'>";
		}

		}else{
echo "<form method='post'>";
		}
		?>
	<input  type="password" name="password" placeholder="Mot de passe"> <br><br>	
	<input type="submit" value="Valider">
	</form></div>
</html>
<?php
}
?>
