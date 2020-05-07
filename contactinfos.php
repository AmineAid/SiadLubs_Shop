<?php
Session_start();
?>
<html><head>
<link href="css/style2.css" type="text/css" rel="stylesheet"/>
</head><body>

		
              
          	
			<?php 
if(isset($_GET['id'])){

	include_once ('database_connection.php');

	$id=$_GET['id'];
	$query1="select name, contact, com from contacts WHERE id='$id'";
	$result1 = mysqli_query($dbc,$query1);
	$row1=mysqli_fetch_array($result1,MYSQLI_ASSOC);
	if($result1){
		if(mysqli_affected_rows($dbc)!=0){
			$name=$row1['name'];
			$region=$row1['com'];
			$contact=$row1['contact'];

			$query2="select * from orders WHERE contact_id='$id' AND status='1'";
			$result2 = mysqli_query($dbc,$query2);
			$numberOfOrders=mysqli_affected_rows($dbc);
			$sumArticles=0;
	    	while($row2 = mysqli_fetch_array($result2,MYSQLI_ASSOC)){
	    		$orderids=$row2['id'];
				$query3="select price, q from articles WHERE order_id='$orderids'";
				$result3 = mysqli_query($dbc,$query3);
	    		while($row3 = mysqli_fetch_array($result3,MYSQLI_ASSOC)){
		    		$sumArticles+=$row3['price']*$row3['q'];}
	    	}


			$query7="select sum(valeur) from versements WHERE contact_id='$id' AND operation_type!='Achat' AND status!=0";
		$result7 = mysqli_query($dbc,$query7);
		$totalv=0;
		    	while($row7 = mysqli_fetch_array($result7,MYSQLI_ASSOC)){
		    		$totalv+=$row7['sum(valeur)'];
		    		}

$query7="select sum(valeur) from versements WHERE contact_id='$id' AND operation_type='Achat' AND status!=0";
		$result7 = mysqli_query($dbc,$query7);
		    	while($row7 = mysqli_fetch_array($result7,MYSQLI_ASSOC)){
		    		$totalv-=$row7['sum(valeur)'];
		    		}

$query7="select sum(price) from orders WHERE contact_id='$id' AND operation_type!='Achat' AND status!=0";
		$result7 = mysqli_query($dbc,$query7);
		$totalb=0;
		    	while($row7 = mysqli_fetch_array($result7,MYSQLI_ASSOC)){
		    		$totalb+=$row7['sum(price)'];
		    		}
$query7="select sum(price) from orders WHERE contact_id='$id' AND operation_type='Achat' AND status!=0";
		$result7 = mysqli_query($dbc,$query7);
		    	while($row7 = mysqli_fetch_array($result7,MYSQLI_ASSOC)){
		    		$totalb-=$row7['sum(price)'];
		    		}

		    		

$sold=$totalv-$totalb;
			echo '<table id="contactinfotable" align="center">';
			echo "<tr><td >";
			echo "<table id='contactinfotable2'>";
			echo "<tr><td>Nom:	   </td><td> $name </td></tr>";
			echo "<tr><td>Region: </td><td> $region </td></tr>";
			echo "<tr><td>Contact: </td><td> $contact </td></tr>";
			echo "<tr><td>Nombre de commandes: </td><td align='center'> $numberOfOrders </td></tr>";
			echo "<tr><td>Total: </td><td> $sumArticles DA </td></tr>";
			echo "<tr><td>Sold: </td><td> $sold DA </td></tr>";
			echo "</table>";
			echo "</td><td valign='midle' align='center'><b>Nouvelle commande</b><br><br>
			<a href='addorder.php?ot=Detail&contactid=$id'>Detail</a> &nbsp;&nbsp;&nbsp;&nbsp;
			<a href='addorder.php?ot=Gros&contactid=$id'>Gros</a><br><br>";
			if (isset($_SESSION['lg']) AND $_SESSION['lg']==2){
			echo "<a href='addordera.php?contactid=$id'>Achat</a>";
		}
			echo "</td><tr><td align='center'><a href='editcontact.php?id=$id'> Modifier Les Informations </td>";
			echo "<td rowspan=><a href='orders.php?contactid=".$id."'>Afficher les commandes<a></td></tr>";
	
			echo "<tr><td align='center'><a href='synthese.php?contactid=".$id."'>Synthese<a></td>";
					echo "<td><a href='versements.php?contactid=".$id."'>Afficher les versements<a></td></tr>";
			echo "</table>";
	
		}
	}
}
			?>
			
		
			
			
			
			
	  
</body>
</html>