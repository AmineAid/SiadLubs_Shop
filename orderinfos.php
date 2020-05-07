<?php
session_start();
?>
<html><head>
<link href="css/style3.css" type="text/css" rel="stylesheet"/>

<script type="text/javascript">

function cancelorder(id,a){
	if(a!=2){
	var r=confirm("Voulez vous annuler cette commande ?");
	if(r){
		window.location.href ='cancelorder.php?id='+id;
	}
}if(a==2){
	var r=confirm("Voulez vous valider cette commande ?");
	if(r){
		window.location.href ='cancelorder.php?todo=v&id='+id;
	}
}
}
function showhide() {
    var x = document.getElementById('complement');
    if (x.style.display === 'none') {
        x.style.display = 'inline';
        document.getElementById('arrow').src = 'img/up.png';
    } else {
        x.style.display = 'none';
         document.getElementById('arrow').src = 'img/down.png';
    }
}

function printdiv(a)
{
		var oldstr = document.body.innerHTML;
	
var headstr = "<html><head><title></title><style type='text/css'>#articlestable,#topinfos {font-size: 10px;}</style></head><body>";
var footstr = "</body>";


document.getElementById("toremove1").innerHTML='';
 var newstr =document.all.item("fiche").innerHTML;

document.body.innerHTML = headstr+newstr+footstr;
window.print();
document.body.innerHTML = oldstr;
return false;
}
</script>
</head><body><div align="center" id="toprint">
<?php
include_once ('database_connection.php');
if(isset($_GET['id']) AND $_GET['id']>0) {
	$orderid=$_GET['id'];
	$query1="select * from orders WHERE id='$orderid'";
	$result1 = mysqli_query($dbc,$query1);
	if($result1){
		if(mysqli_affected_rows($dbc)!=0){
			$row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC);
		    		$contact_id=$row1['contact_id'];
		    		$time=$row1['time'];
		    		$status=$row1['status'];
		    		$last_modified=$row1['last_modified'];
		    		$b=$row1['b'];
		    		$pricea=$row1['pricea'];
		    		$price=$row1['price'];
		    		$operationtype=$row1['operation_type'];
		    		$query2="select * from contacts WHERE id='$contact_id'";
					$result2 = mysqli_query($dbc,$query2);
					if($result2){
		    		if(mysqli_affected_rows($dbc)!=0){
		    			$row2 = mysqli_fetch_array($result2,MYSQLI_ASSOC);
		    			$contactid=$row2['id'];
		    			$contactname=$row2['name'];
		    			$contact=$row2['contact'];
		    			$contactcom=$row2['com'];
		    		}else{
		    			$contactname="Profil supprim&eacute;";
		    			$contact='';
		    		}}else{
		    			$contactname="Profil supprim&eacute;";
		    			$contact='';
		    		} }else{ die("Numero de commande erroné");}
		    		if($status == 0){
		    			echo "<div style='position:fixed;float:center; font-size:60px; 	margin-top:250px;margin-left:350px;color:red;'> <b>COMMANDE ANNULEE </b></div>";
		    		}


















	?><div id="fiche">

	<div align="center">
		<?php 
		echo "<div id='toremove1'><h3><u> Bon: $operationtype</u></h3></div>";?>
		
		

	
	<table id="topinfos" border="1"><tr><td>Mima Lubrifiants<br>012345678</td><td>Bon numero: 
	<?php echo "$orderid</td>"; 

	 echo '<td>Azazga Le: '. date("d-m-Y h:i",$time).''; 
	echo "</td></tr><tr><td width='200' >Client: <a href='contactinfos.php?id=$contactid'>$contactname </a></td>
	<td width='200'>Region: $contactcom</td><td width='200'>Contact: $contact</td></tr></table>";
	?> 
		    		<br><table id="articlestable" ><tr id="tablemenu">


		    		<td>N </td><td style='width:340px;'>Produit</td><td>Prix U</td><td>Quantit&eacute;</td><td>Montant</td></tr>
		    		

		    		<?php

		    		$query5="select * from articles WHERE order_id='$orderid'";
					$result5 = mysqli_query($dbc,$query5);
					$totalorder=0;
					if($result5){
		    		if(mysqli_affected_rows($dbc)!=0){
$i=1;
	
		    	while($row5 = mysqli_fetch_array($result5,MYSQLI_ASSOC)){
		    		$product_name=$row5['product_name'];
		    		$q=$row5['q'];
		    		$uprice=$row5['uprice'];
		    		$price=$row5['price'];

echo "<tr><td>". $i ."</td><td>". $product_name ."</td><td>". $uprice ."</td>
<td>". $q ."</td><td>". $price ."</td></tr>";
		$totalorder+=$price;
		$i++;



}}}
echo "<tr><td style='border:0px;'></td><td style='border:0px;'></td><td style='border:0px;'></td><td>Total</td><td>$totalorder</td></tr>";


$query7="Select id FROM orders WHERE id>$orderid AND contact_id='$contactid'";
		$result7 = mysqli_query($dbc,$query7);
		if(mysqli_affected_rows($dbc)==0){


$query7="select sum(valeur) from versements WHERE contact_id='$contactid' AND operation_type!='Achat' AND status!=0";
		$result7 = mysqli_query($dbc,$query7);
		$sold=0;
		    	while($row7 = mysqli_fetch_array($result7,MYSQLI_ASSOC)){
		    		$sold+=$row7['sum(valeur)'];
		    		}

$query7="select sum(valeur) from versements WHERE contact_id='$contactid' AND operation_type='Achat' AND status!=0";
		$result7 = mysqli_query($dbc,$query7);
		    	while($row7 = mysqli_fetch_array($result7,MYSQLI_ASSOC)){
		    		$sold+=$row7['sum(valeur)'];
		    		}

$query7="select sum(price) from orders WHERE contact_id='$contactid' AND operation_type!='Achat' AND status!=0";
		$result7 = mysqli_query($dbc,$query7);

		    	while($row7 = mysqli_fetch_array($result7,MYSQLI_ASSOC)){
		    		$sold+=$row7['sum(price)'];
		    		}
$query7="select sum(price) from orders WHERE contact_id='$contactid' AND operation_type='Achat' AND status!=0";
		$result7 = mysqli_query($dbc,$query7);
		    	while($row7 = mysqli_fetch_array($result7,MYSQLI_ASSOC)){
		    		$sold+=$row7['sum(price)'];
		    		}

		    		


echo "<tr><td style='border:0px;'></td><td style='border:0px;'></td><td style='border:0px;'></td>
<td>Sold</td><td>$sold</td></tr>";
}

echo "</table></div><div class='pagebreak' style='page-break-before: always;'></div></div>";






echo "<br><br><hr><table>";

if (isset($_SESSION['lg']) AND $_SESSION['lg']==2 AND $status==1){
echo "<tr>
<td style='padding:30px;'><a href='editorders.php?bonid=$orderid'><img src='img/edit.png' width='70'></a></td>
<td style='padding:30px;'><a href='#' onclick='cancelorder($orderid)'><img src='img/cancel.png' width='70'></a></td>
<td style='padding:30px;'><a href='bill.php?id=$orderid'><img src='img/bill.png' width='70'></a></td>";
}elseif(isset($_SESSION['lg']) AND $_SESSION['lg']==2 AND $status==0){
echo "<td style='padding:30px;'><a href='#' onclick='cancelorder($orderid,2)'><img src='img/validate.png' width='70'></a></td>";
}

echo "
<td style='padding:30px;'><a href='#' onclick='printdiv()'><img src='img/print.png' width='70'></a></td><td style='padding:30px;display:none;'><img src='img/excel.png' width='70'></td></tr></table>";


















































}}

?>
</div>
</body></html>