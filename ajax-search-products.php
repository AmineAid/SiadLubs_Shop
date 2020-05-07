<?php
Session_start();



?>
<script type="text/javascript">
function intermed(value,ot){
var activefields2 = document.getElementById('trn').value ;
 		
 		plus(activefields2,value,ot);

 	}
</script>
<?php


include_once ('database_connection.php');

if(isset($_GET['keyword']) AND $_GET['keyword']!="@all"){
    $keyword = 	trim($_GET['keyword']) ;
$keyword = mysqli_real_escape_string($dbc, $keyword);
$keyword = preg_replace("`'`",'’',$keyword);
setcookie("key", $keyword, time()+3600);
if ($keyword=="@all"){
$query = "select * from products WHERE type=1";
}else{
$query = "select * from products where type=1 AND (id like '%$keyword%' or reference like '%$keyword%' or designation like '%$keyword%') limit 0,10";
}
$result = mysqli_query($dbc,$query);
if($result){
    if(mysqli_affected_rows($dbc)!=0){
	echo '<table style="font-size: 20px;font-weight:bold;"><tr>
	<td style="padding:5px;width:100px;" align="center" width="300">R&eacute;f&eacute;rance</td>
	<td align="center" style="padding:5px;width:200px;">D&eacute;signation</td>
	<td align="center" style="padding:5px;width:30px;">Quantit&eacute;</td>
	<td align="center" style="padding:20px;width:30px;">Prix</td></tr>';
 $rmt=0;  
 
	 while($row = mysqli_fetch_array($result,MYSQLI_ASSOC)){
 $product_id=$row['id'];
 $product_reference=$row['reference'];
 $product_designation=$row['designation'];
 $q=$row['q'];
 $pricea=$row['pricea'];

 if(isset($_GET['ot']) AND $_GET['ot']=="Gros"){
 	$ot="Gros";
 $price=$row['priceg'];
}elseif(isset($_GET['ot']) AND $_GET['ot']=="Achat"){
	$ot="Achat";
	 $price=$row['pricea'];
}else{
	$ot="Detail";
	 $price=$row['priced'];
}
     echo "<tr valign='middle'>";
     ?>
     <td valign='middle' align='center'><a style='color:#333333;' href='#' onclick="intermed('<?php echo "$product_id&#95;$product_designation&#95;$pricea&#95;$price"; ?>','<?php echo $ot; ?>')"><b><?php echo $product_reference; ?></b></a></td>
     <td valign='middle' align='center'><a style='color:#333333;' href='#' onclick="intermed('<?php echo "$product_id&#95;$product_designation&#95;$pricea&#95;$price"; ?>','<?php echo $ot; ?>')"><b><?php echo $product_designation; ?></b></a></td>
     <td valign='middle' align='center'><a style='color:#333333;' href='#' onclick="intermed('<?php echo "$product_id&#95;$product_designation&#95;$pricea&#95;$price"; ?>','<?php echo $ot; ?>')"><b><?php echo $q; ?></b></a></td>
     <td valign='middle' align='center'><a style='color:#333333;' href='#' onclick="intermed('<?php echo "$product_id&#95;$product_designation&#95;$pricea&#95;$price"; ?>','<?php echo $ot; ?>')"><b><?php echo $price; ?></b></a></td>
     <?php 
	 $sumArticles=0;

	}







	
echo '</table>';
}else {
        echo 'Aucun Resultat pour :"'.$_GET['keyword'].'"';
    }
	
    

		}else {
        echo 'Aucun Resultat pour :"'.$_GET['keyword'].'"';
    }
}
  /*
}
}elseif(isset($_GET['keyword']) AND $_GET['keyword']=="@mine"){
include_once ('database_connection.php');


$query = "select * from v ORDER BY id desc";

$result = mysqli_query($dbc,$query);
if($result){
    if(mysqli_affected_rows($dbc)!=0){

	echo '<table><tr><td align="center" style="width:100px;">id</td><td align="center" >Date</td><td align="center" width="300">ref</td><td align="center" >Designation</td><td width="100" align="center">Prix U</td><td width="100" align="center">quantit&eacute;</td><td>Prix T</td></tr>';
         while($row = mysqli_fetch_array($result,MYSQLI_ASSOC)){
		  echo "<tr><td>$row[id]</td><td>$row[date]</td><td>$row[ref]</td><td>$row[des]</td><td>$row[pu]</td><td>$row[q]</td><td>$row[pt]</td></tr>";
		  }
	
	
	}}}

else {
    echo 'Parameter Missing';
}



*/
?>
