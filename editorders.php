<?php
	include_once ('database_connection.php');



if(isset($_POST['activefield'])){
	$activefield=$_POST['activefield'];
	$activefield = explode(":", $activefield);
	$numberoffields = $activefield[0];
	$activefields = explode("_", $activefield['1']);
	$orderid = 	trim($_POST['orderid']) ;
if (isset($_POST['contactname'])){
$contactname = 	trim($_POST['contactname']) ;
$contactname = mysqli_real_escape_string($dbc, $contactname);
$contactname = htmlentities($contactname);
$contact = 	trim($_POST['contact']) ;
$contact = mysqli_real_escape_string($dbc, $contact);
$contact = htmlentities($contact);
$region = 	trim($_POST['region']) ;
$region = mysqli_real_escape_string($dbc, $region);
$region = htmlentities($region);	
if(!mysqli_query($dbc,"INSERT INTO contacts  (name, contact, com) VALUES('$contactname', '$contact', '$region')")){
	echo "<div id='error' align='center'>Une erreur s&#39;est produite <br></div>", mysqli_error($dbc);
die;
}
$contactid=mysqli_insert_id($dbc);
}else{
$contactid = trim($_POST['client']) ;
$query3="select name from contacts WHERE id='$contactid'";
				$result3 = mysqli_query($dbc,$query3);
		    	$row3 = mysqli_fetch_array($result3,MYSQLI_ASSOC);
$contactname = $row3['name'];
}

$time = 	trim($_POST['time']) ;
$time = mysqli_real_escape_string($dbc, $time);
if(!$time=strtotime($time)){
$time=time();
}
$ctime=time();
$operationtype = 	trim($_POST['operationtype']) ;
$operationtype = mysqli_real_escape_string($dbc, $operationtype);
$operationtype = htmlentities($operationtype);

$tprice = 	trim($_POST['total']) ;
$tprice = mysqli_real_escape_string($dbc, $tprice);
$tprice = htmlentities($tprice);

$tpricea = 	trim($_POST['totala']) ;
$tpricea = mysqli_real_escape_string($dbc, $tpricea);
$tpricea = htmlentities($tpricea);

$b = $tprice-$tpricea ;


$versement = 	trim($_POST['versement']) ;
$versement = mysqli_real_escape_string($dbc, $versement);
$versement = htmlentities($versement);
if($operationtype!='Achat'){
$versement *= (-1);
}else{
	$tprice*= (-1);
}
	


$status = 	1;
if (!mysqli_query($dbc,"UPDATE orders  SET operation_type='$operationtype', contact_id='$contactid', contact_name='$contactname', price='$tprice', pricea='$tpricea', b='$b', time='$time', last_modified='$ctime', status='$status' WHERE id='$orderid'")){
	echo "<div id='error' align='center'>Une erreur s&#39;est produite <br></div>", mysqli_error($dbc);

die;
}
if (!mysqli_query($dbc,"UPDATE versements  SET contact_id='$contactid', contact_name='$contactname', valeur='$versement', time='$time', operation_type='$operationtype' WHERE order_id='$orderid'")){
	echo "<div id='error' align='center'>Une erreur s&#39;est produite <br></div>", mysqli_error($dbc);
die;
}
$versement_id=mysqli_insert_id($dbc);

$query5="SELECT * FROM articles WHERE order_id='$orderid'";
		$result5 = mysqli_query($dbc,$query5);
		if($result5){
		    if(mysqli_affected_rows($dbc)!=0){
		    	$i=0;
		    	while($row5 = mysqli_fetch_array($result5,MYSQLI_ASSOC)){
		    		$id=$row5['id'];
		    		$q=$row5['q'];
		    		$productid=$row5['product_id'];
		    		if($operationtype=="Achat"){
		    		mysqli_query($dbc,"UPDATE products SET q=q-$q WHERE id='$productid'");
		    	}else{
		    		mysqli_query($dbc,"UPDATE products SET q=q+$q WHERE id='$productid'");
		    	}
		    		mysqli_query($dbc,"DELETE FROM articles WHERE id='$id'");
		    		}}}
	for($i=0; $i<$numberoffields;$i++){

		$n=$activefields[$i];


$product = 	trim($_POST["product$n"]) ;
$product = mysqli_real_escape_string($dbc, $product);
$product = explode("_", $product);

$productid = htmlentities($product[0]);

$productname = htmlentities($product[1]);

$pricea = htmlentities($product[2]);



$uprice = 	trim($_POST["uprice$n"]) ;
$uprice = mysqli_real_escape_string($dbc, $uprice);
$uprice = htmlentities($uprice);



$q = 	trim($_POST["q$n"]) ;
$q = mysqli_real_escape_string($dbc, $q);
$q = htmlentities($q);

$price = $q*$uprice;



$b = $price-$pricea*$q;




if(!mysqli_query($dbc,"INSERT INTO articles  (order_id, contact_id, contact_name, product_id, product_name, operation_type, uprice, price, q, b, time)
				VALUES('$orderid', '$contactid', '$contactname', '$productid', '$productname', '$operationtype', '$uprice', '$price', '$q', '$b', '$time')")){
echo "<div id='error' align='center'>Une erreur s&#39;est produite <br></div>", mysqli_error($dbc);
for ($j=0; $j < $i ; $j++) { 
	$idtodel=$articlesids[$j];
	mysqli_query($dbc,"DELETE FROM articles WHERE id='$idtodel'");
}
die;
}
$articlesids[$i]=mysqli_insert_id($dbc);


}
for($i=0; $i<$numberoffields;$i++){

		$n=$activefields[$i];
$product = 	trim($_POST["product$n"]) ;
$product = mysqli_real_escape_string($dbc, $product);
$product = explode("_", $product);


$productid = htmlentities($product[0]);

$uprice = 	trim($_POST["uprice$n"]) ;
$uprice = mysqli_real_escape_string($dbc, $uprice);
$uprice = htmlentities($uprice);

$q = 	trim($_POST["q$n"]) ;
$q = mysqli_real_escape_string($dbc, $q);
$q = htmlentities($q);
if($operationtype=="Achat"){
mysqli_query($dbc,"UPDATE products SET q=q+$q , pricea=$uprice WHERE id='$productid'");
}else{
mysqli_query($dbc,"UPDATE products SET q=q-$q WHERE id='$productid'");
}

}










echo '<SCRIPT LANGUAGE="JavaScript">document.location.href="orderinfos.php?id='.$orderid.'";
</SCRIPT>';


}elseif(isset($_GET['bonid'])){

$orderid=$_GET['bonid'];

$query12="select * FROM orders WHERE id='$orderid'";
				$result12 = mysqli_query($dbc,$query12);
		if($result12){
		    if(mysqli_affected_rows($dbc)!=0){
		    	while($row12 = mysqli_fetch_array($result12,MYSQLI_ASSOC)){
$contactid=$row12['contact_id'];
$contactname=$row12['contact_name'];
$time=$row12['time'];
$status=$row12['status'];
$operationtype=$row12['operation_type'];
}}}










	//php

	?><html><head>
<link href="css/style3.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/jquery.watermark.js"></script>
<script type="text/javascript">



function ifnewcontact() {
if(document.addorder.client.value == "neWcntct"){
     document.getElementById("newcontact").innerHTML='Nom et prenom: <input name="contactname" id="contactname" onkeypress="noq(event)" > Region: <input name="region" id="region"  onkeypress="noq(event)" > Contact: <input name="contact" id="contact" onkeypress="noq(event)" > <label><input id="nocontact" type="checkbox" >neant</label>';
 }else{
 	document.getElementById("newcontact").innerHTML=' ';
 }}

 function removetr(a){
 

 	document.getElementById("tr"+a).style.display = "none";
		document.getElementById("product"+a).disabled = true;
		document.getElementById("q"+a).disabled = true;
		document.getElementById("uprice"+a).disabled = true;
		document.getElementById("price"+a).disabled = false;
		var activefields = document.getElementById('activefield').value ;
 		var array = activefields.split(":");
 		var numberoffields = +array[0];
 		numberoffields-=1;
 		if(numberoffields>0){
 			 		var array2 = array[1].split("_");
 			 		var lastone=array2[numberoffields];
 			 		if(lastone==a){
 			 			var lastnum=numberoffields-1;
 			 			lastone=array2[lastnum];
 			 		}
		activefields=numberoffields+":";
		for (var i = 0; i <= numberoffields; i++) {
			if(array2[i]!=a){
				if(lastone!= array2[i]){
 			activefields=activefields+array2[i]+"_";
 		}else{
 			activefields=activefields+array2[i];}
 		}
 		};
 	}else{
 		activefields="0:";
 	}
 		document.getElementById("activefield").value=activefields;


}
function addproduct(c,ot){

var k = c;
	$(document).ready(function() {

$("#faq_search_input").keyup(function()
{
var faq_search_input = $(this).val();
var dataString = 'keyword='+ faq_search_input;
if(faq_search_input.length>0)
{	
	 
	document.getElementById("searchresultdata").style ="display:block";


$.ajax({
type: "GET",
url: "ajax-search-products.php?n="+k+"&ot="+ot,
data: dataString,

success: function(server_response)
{

$('#searchresultdata').html(server_response).show();


}
});
}else{
	document.getElementById("searchresultdata").innerHTML=" ";
	document.getElementById("searchresultdata").style ="display:none";
}
});
});





	document.getElementById('addproduct').style.display= 'table-row';
	$("#faq_search_input").focus();

	




}
 function plus(a,p,ot){
 	//('$orderid', '$contactid', '$contactname', '$productid', '$productname', '$operationtype', '$uprice', '$price', '$q', '$b', '$time')")){

 	document.getElementById('tr'+a).style.display = "table-row";
 	var b= +a+1;
 		document.getElementById('product'+a).disabled = false;
 		document.getElementById('uprice'+a).disabled = false;
 		document.getElementById('q'+a).disabled = false;
 		document.getElementById('price'+a).disabled = true;
 		
 		var activefields = document.getElementById('activefield').value ;
 		var array = activefields.split(":");
 		var numberoffields = +array[0];
 		if(numberoffields!=0){
 		numberoffields+=1;
 		var array2 = array[1].split("_");
		activefields=numberoffields+":";
 		for (var i = 0; i < array2.length; i++) {
 			activefields=activefields+array2[i]+"_";
 		};
 		activefields=activefields+a;
 	}else{ activefields="1:"+a; }
		
	if(a<38){
		document.getElementById("pluslogo").innerHTML='<input type="hidden" id="trn" value="'+b+'"><a href="#" onclick="addproduct('+b+',\''+ot+'\')"><img src="img/plus.png" width="30"></a><input type="hidden" id="activefield" name="activefield" value="'+activefields+'">';
}else{
	document.getElementById("pluslogo").innerHTML='<input type="hidden" id="activefield" name="activefield" value="'+activefields+'">';
}


document.getElementById('product'+a).value = p;
document.getElementById('faq_search_input').value = "";
document.getElementById('searchresultdata').innerHTML = " ";

document.getElementById('addproduct').style.display= 'none';

calculate();
}



function onlynumbers(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  if ((key < 48 || key > 57) && !(key == 8 || key == 9 || key == 13 || key == 37 || key == 46) ){
    theEvent.returnValue = false;
    if (theEvent.preventDefault) theEvent.preventDefault();
  }}
       function noq(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  if (key == 39 || key == 34 ){
    theEvent.returnValue = false;
    if (theEvent.preventDefault) theEvent.preventDefault();
  }}

  function calculate(b){
  	var activefields = document.getElementById('activefield').value ;
 		var array = activefields.split(":");
 		var numberoffields = +array[0];
 		var array2 = array[1].split("_");
 		var total = 0;
 		var totala = 0;
 		for (var i = 0; i < numberoffields; i++){
if(document.getElementById('q'+array2[i]).value != ""){
q=document.getElementById('q'+array2[i]).value;
}else {
var q=1;
}

product=document.getElementById('product'+array2[i]).value;
product=product.split("_");

var upricea= +product[2];
upricea*=q;
var uprice= +product[3];

if(b!=1){
var upricecalc=uprice;
document.getElementById('uprice'+array2[i]).value=uprice;
}else{
	var upricecalc=document.getElementById('uprice'+array2[i]).value;
}
var price=q*upricecalc;
price=Math.round(price* 100) / 100;
document.getElementById('price'+array2[i]).value=price;
total+=price;

totala+=upricea;
};

document.getElementById('totala').value=Math.round(totala*100)/100;
document.getElementById('total').value=Math.round(total*100)/100;
  }
   

<?php
echo'function isInArray(array, search){
    return array.indexOf(search) >= 0;
}
var contacts=[];';

		$query5="select * from contacts";
		$result5 = mysqli_query($dbc,$query5);
		if($result5){
		    if(mysqli_affected_rows($dbc)!=0){
		    	
		    	$i=0;
		    	while($row5 = mysqli_fetch_array($result5,MYSQLI_ASSOC)){
		    	echo 'contacts['.$i.']="'. stripslashes($row5['name']) .'";';
$i++;
		    }
		    
		}}

?>


  var error=0;
function validate() {

  if(document.addorder.client.value != "0" ) {
 validate1();
  }
  else {
    alert("Vous devez selectioner un client");
  }}



















  function validate1() {
  if(document.addorder.client.value == "neWcntct" && document.addorder.contactname.value == "") {
    alert("Vous devez introduir un nom de client"); 
  }
  else {
validate2();
  }}

function validate2() {
  if(document.addorder.client.value == "neWcntct" && document.addorder.contact.value == "" && document.getElementById("nocontact").checked==false) {
    alert("Le champ contact est vide"); 
  }
  else {
validate3();
  }}

  function validate3() {
  	if(document.addorder.client.value == "neWcntct" && document.addorder.contactname.value != "") {
var s=htmlEntities(document.addorder.contactname.value);
  if(isInArray(contacts, s)){
  alert("Un contact portant le meme nom existe deja");
}else{
  validate4();}
}else{
	validate4();
}}



 
function validate4(){
	var activefields = document.getElementById('activefield').value ;
 		var array = activefields.split(":");
 		var numberoffields = +array[0];
 		var array2 = array[1].split("_");

for (var i = 0; i < numberoffields; i++) {
 			if(numberoffields<1){
alert("Vous devez introduir au minimum 1 article");
error=1;
 			}
 			if(document.getElementById('q'+array2[i]).value=="" || document.getElementById('q'+array2[i]).value < 1){
alert("Vous devez introduir une quantite pour le l'article N "+array2[i]);
error=1;
 			}

 		};
 		if(error=="0"){
 			document.getElementById('total').disabled=false;

 			document.addorder.submit();
 		}else{
 			alert("error");
 			error=0;
 		}

}

function htmlEntities(str) {
    
    return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/é/g, '&eacute;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}
</script>
</head><body>

<form autocomplete='off' method="POST" name="addorder" id="addorder">
	<table width="100%" id="topordertable" style="font-size:20px;"><tr><td>Client:
		<select name="client" id="client" onchange="ifnewcontact()">
		<option value='0'>- - - - - - - - - - - -</option>
		<option value='neWcntct' >Nouveau Client</option>
				<?php 

$query3="select * from contacts";
				$result3 = mysqli_query($dbc,$query3);
		if($result3){
		    if(mysqli_affected_rows($dbc)!=0){
		    	while($row3 = mysqli_fetch_array($result3,MYSQLI_ASSOC)){
		    		if($row3['id']==$contactid){
						echo "<option value='". $row3['id'] ."'' selected>". $row3['name'] ."</option>	";
		    	}else{
		    		echo "<option value='". $row3['id'] ."''>". $row3['name'] ."</option>	";
		    	}
}}} ?>
		</select> </td>
		<td ></td>
		<td ></td>
		<td ></td>

		<td align="right">
		Azazga Le: <input value="<?php echo date("d-m-Y h:i",$time); ?>" name="time"></td></tr>
	</table>
	<div id="newcontact" style="font-size:20px;"></div>
	<table  width="80%"id="addordertable" style="font-size:20px;margin-left: auto;margin-right: auto;">
		<tr>
		<td width='400'><b>Article</b></td><td><b>Prix unitaire</b></td><td><b>Quantit&eacute;</b></td><td style='width:200px;'><b>Montant</b></td><td></td></tr>
		<tr id='addproduct'style='display:none;'><td colspan="4" align='center' style=''> 

			<div id="search"><input autocomplete='off' style='background:#C2C2C2;width:400px;' name="query" type="text" id="faq_search_input" placeholder="Rechercher un produit" /> </div>
			<br>
	<div id="searchresultdata" style="background-color:green;" align="center"></div>

		</td></tr>
		
		<?php 

		$query3="select * from articles WHERE order_id='$orderid'";
				$result3 = mysqli_query($dbc,$query3);
				$tprice=0;
				$tpricea=0;
		if($result3){
		    if(mysqli_affected_rows($dbc)!=0){
		    	$i=1;
		    	
		    	
		    	while($row3 = mysqli_fetch_array($result3,MYSQLI_ASSOC)){

$productid = 	$row3['product_id'] ;
$uprice = 	$row3['uprice'] ;
$price = 	$row3['price'] ;
$pricea = 	$price-$row3['b'] ;
$q = 	$row3['q'] ;


	echo"<tr id='tr$i'><td><select name='product$i' id='product$i' onchange='calculate()'>";


$query1="select * from products ORDER by designation";
		$result1 = mysqli_query($dbc,$query1);
		$productsoptions="";
		if($result1){
		    if(mysqli_affected_rows($dbc)!=0){
		    	
		    	while($row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC)){
		    		$id=$row1['id'];
		    		$designation=$row1['designation'];
		    		$priceas=$row1['pricea'];

		    		
		    			if($operationtype=="Achat"){
		    			$prices=$row1['pricea'];
		    		}elseif($operationtype=="Gros"){
		    			$prices=$row1['priceg'];
		    		}else{
		    		$prices=$row1['priced'];
		    	}
		    		
		    		if($id==$productid){
		    			$pricea=$row1['pricea'];
		    		 echo "<option value='$id&#95;$designation&#95;$priceas&#95;$prices' selected>$designation</option>	";
		    		 }else{
		    		 	echo "<option value='$id&#95;$designation&#95;$priceas&#95;$prices'>$designation</option>	";
		    		 }
		    		}}}

		    		echo "</select></td><td><input onClick='this.select();' name='uprice$i' id='uprice$i' value='$uprice' onkeyup='calculate(1)' onkeypress='onlynumbers(event)' ></td>
		  <td><input onClick='this.select();' name='q$i' id='q$i' value='$q' onkeyup='calculate(1)' onkeypress='onlynumbers(event)' style='width:100px;' ></td>
		<td><input name='price$i' id='price$i' value='$price' disabled></td>
		<td><a href='#'' onclick='removetr($i)'><img src='img/remove.png' width='25'></a></td></tr>";
$i++;
$tprice+=$price;
$tpricea+=$pricea;
}
}
}
$active=$i-1;
$query1="select * from products WHERE type!=0 ORDER by designation";
		$result1 = mysqli_query($dbc,$query1);
		$productsoptions="";
		if($result1){
		    if(mysqli_affected_rows($dbc)!=0){
		    	
		    	while($row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC)){
		    		$id=$row1['id'];
		    		$designation=$row1['designation'];
		    		$pricea=$row1['pricea'];
		    		if($operationtype=="Achat"){
		    			$price=$row1['pricea'];
		    		}elseif($operationtype=="Gros"){
		    			$price=$row1['priceg'];
		    		}else{
		    		$price=$row1['priced'];
		    	}
		    		
		    		// $productsoptions .= "<option value='". $row1['id'] ."_". $row1['price'] ."'>". $row1['reference'] ."</option>	";
		    		 $productsoptions .= "<option value='$id&#95;$designation&#95;$pricea&#95;$price'>$designation</option>	";
		    		}}}

for($i;$i<39;$i++){
echo"<tr id='tr$i' style='display:none'><td><select name='product$i' id='product$i' onchange='calculate()'>";
echo $productsoptions;
 

	echo "</select></td><td><input onClick='this.select();' name='uprice$i' id='uprice$i' value='0' onkeyup='calculate(1)' onkeypress='onlynumbers(event)' disabled></td>
		  <td><input onClick='this.select();' name='q$i' id='q$i' value='1' onkeyup='calculate(1)' onkeypress='onlynumbers(event)' style='width:100px;' disabled></td>
		<td><input name='price$i' id='price$i' value='0' disabled></td>
		<td><a href='#'' onclick='removetr($i)'><img src='img/remove.png' width='25'></a></td></tr>";
}
$query3="select valeur from versements WHERE order_id='$orderid'";
				$result3 = mysqli_query($dbc,$query3);
		    	$row3 = mysqli_fetch_array($result3,MYSQLI_ASSOC);
		    	$versement=0;
		    	if(mysqli_affected_rows($dbc)!=0){
		    	$versement=$row3['valeur'];
		    		}
		?>
<tr><td align="left">
		<div id="pluslogo"><input type='hidden' id='trn' value='<?php echo $active+1; ?>'><a href="#" onclick="addproduct(<?php echo $active+1; ?>,'<?php echo $operationtype; ?>')"><img src="img/plus.png" width="30"></a>

<input type="hidden"  name="activefield" id="activefield" value="<?php echo "$active:"; for($j=1;$j<=$active;$j++){if($j!=$active) echo "$j&#95;"; else echo "$j";}?>" ></div>
	
		</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>Total:</td><td><input name="total" id="total" value="<?php echo $tprice;?>" disabled></td></tr>

			<tr><td></td><td></td><td>Versement: </td><td><input name="versement" id="versement" value="<?php echo $versement;?>" onkeypress="onlynumbers(event)" ></td></tr>
		</table>

		<br><br><br><br><br><div align="center"><a href="#" onclick="validate()"><img type="submit" src="img/save.png" width="50"></a></div>
		<!-- <tr><td>eee</td><td>eee</td><td>eee</td><td>eee</td><td>eee</td><td>eee</td><td>eee</td></tr>-->
		<?php echo "<input type='hidden' name='operationtype' value='$operationtype'>";
				echo "<input type='hidden' name='totala' id='totala' value='$tpricea'>"; 
				echo "<input type='hidden' name='orderid' id='orderid' value='$orderid'>"; ?>
</form>
</body></html>
<?php
}
?>