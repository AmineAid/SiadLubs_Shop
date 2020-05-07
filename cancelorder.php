<?php
session_start();
if (isset($_SESSION['lg']) AND $_SESSION['lg']==2){
	include_once ('database_connection.php');
	if (isset($_GET['id'])){
		$orderid = 	trim($_GET['id']) ;
		$query5="SELECT * FROM orders WHERE id='$orderid'";
		$result5 = mysqli_query($dbc,$query5);
		    	$row5 = mysqli_fetch_array($result5,MYSQLI_ASSOC);
		    		$operationtype=$row5['operation_type'];

		if (!isset($_GET['todo'])){
$status=0;

$query5="SELECT * FROM articles WHERE order_id='$orderid'";
		$result5 = mysqli_query($dbc,$query5);
		    	while($row5 = mysqli_fetch_array($result5,MYSQLI_ASSOC)){
		    		$id=$row5['id'];
		    		$q=$row5['q'];
		    		$productid=$row5['product_id'];
		    		if($operationtype=="Achat"){
		    		mysqli_query($dbc,"UPDATE products SET q=q-$q WHERE id='$productid'");
		    	}else{
		    		mysqli_query($dbc,"UPDATE products SET q=q+$q WHERE id='$productid'");
		    	}
		    	
		    		}
		}else{
			$status=1;
			$query5="SELECT * FROM articles WHERE order_id='$orderid'";
		$result5 = mysqli_query($dbc,$query5);
		    	while($row5 = mysqli_fetch_array($result5,MYSQLI_ASSOC)){
		    		$id=$row5['id'];
		    		$q=$row5['q'];
		    		$productid=$row5['product_id'];
		    		if($operationtype=="Achat"){
		    		mysqli_query($dbc,"UPDATE products SET q=q+$q WHERE id='$productid'");
		    	}else{
		    		mysqli_query($dbc,"UPDATE products SET q=q-$q WHERE id='$productid'");
		    	}
		    	
		    		}
		}
		mysqli_query($dbc,"UPDATE  versements SET status='$status' WHERE order_id=$orderid ");
if(mysqli_query($dbc,"UPDATE  orders SET status='$status' WHERE id=$orderid ")){

echo '<SCRIPT LANGUAGE="JavaScript">
document.location.href="orderinfos.php?id='.$orderid.'";
</SCRIPT>';

}else{
	echo "<div id='error' align='center'>Une erreur s&#39;est produite </div>";
}}}
?>