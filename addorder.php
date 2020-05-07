<?php
	include_once ('database_connection.php');
	if(isset($_GET['ot']) AND $_GET['ot']=="Gros"){
$ot="Gros";
	}else{

		$ot="Detail";
	}

if(isset($_POST['activefield'])){
	$activefield=$_POST['activefield'];
	$activefield = explode(":", $activefield);
	$numberoffields = $activefield[0];
	$activefields = explode("_", $activefield['1']);
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

$operationtype = 	trim($_POST['operationtype']) ;
$operationtype = mysqli_real_escape_string($dbc, $operationtype);
$operationtype = htmlentities($operationtype);

$tprice = 	trim($_POST['total']) ;
$tprice = mysqli_real_escape_string($dbc, $tprice);
$tprice = htmlentities($tprice);

$pricea = 	trim($_POST['totala']) ;
$pricea = mysqli_real_escape_string($dbc, $pricea);
$pricea = htmlentities($pricea);

$b = $tprice-$pricea ;

$versement = 	trim($_POST['versement']) ;
$versement = mysqli_real_escape_string($dbc, $versement);
$versement = htmlentities($versement);
$versement *= (-1);
	


$status = 	1;
if (!mysqli_query($dbc,"INSERT INTO orders  (operation_type, contact_id, contact_name, price, pricea, b, time, last_modified, status) 
									VALUES('$operationtype','$contactid', '$contactname','$tprice', '$pricea', '$b', '$time', '$time', '$status')")){
	echo "<div id='error' align='center'>Une erreur s&#39;est produite 0x1<br></div>", mysqli_error($dbc);

echo "versement";
die;
}
$orderid=mysqli_insert_id($dbc);

if (!mysqli_query($dbc,"INSERT INTO versements  (order_id, contact_id, contact_name, valeur, time, operation_type) 
									VALUES( '$orderid', '$contactid', '$contactname','$versement', '$time', '$operationtype')")){
	echo "<div id='error' align='center'>Une erreur s&#39;est produite 0x2<br></div>", mysqli_error($dbc);
die;
}
$versement_id=mysqli_insert_id($dbc);
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
echo "<div id='error' align='center'>Une erreur s&#39;est produite x04<br></div>", mysqli_error($dbc);
for ($j=0; $j < $i ; $j++) { 
	$idtodel=$articlesids[$j];
	mysqli_query($dbc,"DELETE FROM articles WHERE id='$idtodel'");
}
	mysqli_query($dbc,"DELETE FROM versements WHERE id='$versement_id'");
die;
}else{

}
$articlesids[$i]=mysqli_insert_id($dbc);


}
for($i=0; $i<$numberoffields;$i++){

		$n=$activefields[$i];
$product = 	trim($_POST["product$n"]) ;
$product = mysqli_real_escape_string($dbc, $product);
$product = explode("_", $product);

$productid = htmlentities($product[0]);

$q = 	trim($_POST["q$n"]) ;
$q = mysqli_real_escape_string($dbc, $q);
$q = htmlentities($q);
mysqli_query($dbc,"UPDATE products SET q=q-$q WHERE id='$productid'");
}
echo '<SCRIPT LANGUAGE="JavaScript">
document.location.href="orderinfos.php?id='.$orderid.'";
</SCRIPT>';


}else{














	//php

	?><html><head>
<link href="css/style3.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/jquery.watermark.js"></script>
<script type="text/javascript">



function ifnewcontact() {
if(document.addorder.client.value == "neWcntct"){
     document.getElementById("newcontact").innerHTML='Nom et prenom: <input name="contactname" id="contactname"  onkeypress="noq(event)" > Region: <input name="region" id="region" onkeypress="noq(event)" > Contact: <input name="contact" id="contact"  onkeypress="noq(event)" > <label><input id="nocontact" type="checkbox" >neant</label>';
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
		    		if(isset($_GET['contactid']) AND $row3['id']==$_GET['contactid']){
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
		Azazga Le: <input value="<?php echo date("d-m-Y h:i",time()); ?>" name="time"></td></tr>
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
		<!--<tr id="tr1"><td><input name="dimension11" id="dimension11" onkeyup="calculate()" onkeypress="onlynumbers(event)"></td><td><input onkeyup="calculate()" name="dimension21" id="dimension21" onkeypress="onlynumbers(event)"></td>
			<td><input name="number1" id="number1" value="1" onkeyup="calculate()" onkeypress="onlynumbers(event)"></td>
	
		<td><select name="vitre1" id="vitre1" onchange="calculate()">
			?php 
$query1="select * from products WHERE type=1 ORDER by listing";
		$result1 = mysqli_query($dbc,$query1);
		if($result1){
		    if(mysqli_affected_rows($dbc)!=0){
		    	while($row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC)){
		    		echo "<option value='". $row1['id'] ."_". $row1['price'] ."'>". $row1['reference'] ."</option>	";
		    		$priceuu=$row1['price'];
}}} ?>
			</select></td> 
		<td><select name="baguette" id="baguette" onchange="calculate()">
?php 
$query2="select * from products WHERE type=2 ORDER by listing";
		$result2 = mysqli_query($dbc,$query2);
		if($result2){
		    if(mysqli_affected_rows($dbc)!=0){
		    	while($row2 = mysqli_fetch_array($result2,MYSQLI_ASSOC)){
		    		echo "<option value='". $row2['id'] ."_". $row2['price'] ."'>". $row2['reference'] ."</option>	";
		    		$priceuu+=$row2['price'];
}}} ?>
		</select></td>
		<td><select name="vitre2" id="vitre2" onchange="calculate()">
		?php 
		$result1 = mysqli_query($dbc,$query1);
		if($result1){
		    if(mysqli_affected_rows($dbc)!=0){
		    	while($row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC)){
		    		echo "<option value='". $row1['id'] ."_". $row1['price'] ."'>". $row1['reference'] ."</option>	";
		    		$priceuu+=$row1['price'];
}}} ?>
</select></td>
		<td><select name="sens" id="sens"  onchange="calculate()"><option value="EXT">EXT</option><option value="INT">INT</option></select>
		</td><td><input name="uprice1" id="uprice1" value="

		?php echo $priceuu; ?>" onkeyup="calculate(1)"  onkeypress="onlynumbers(event)"></td>
		<td><input name="price1" id="price1" value="

		?php echo $priceuu; ?>" disabled></td><td><a href="#" onclick="removetr(1)"><img src="img/remove.png" width="25"></a></td></tr>
		-->
		<?php 
$query1="select * from products WHERE type!=0 ORDER by designation";
		$result1 = mysqli_query($dbc,$query1);
		$productsoptions="";
		if($result1){
		    if(mysqli_affected_rows($dbc)!=0){
		    	
		    	while($row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC)){
		    		$id=$row1['id'];
		    		$designation=$row1['designation'];
		    		$pricea=$row1['pricea'];
		    		if(isset($_GET['ot']) AND $_GET['ot']=="Gros"){
		    			$price=$row1['priceg'];
		    		}else{
		    		$price=$row1['priced'];
		    	}
		    		
		    		// $productsoptions .= "<option value='". $row1['id'] ."_". $row1['price'] ."'>". $row1['reference'] ."</option>	";
		    		 $productsoptions .= "<option value='$id&#95;$designation&#95;$pricea&#95;$price'>$designation</option>	";
		    		}}}

for($i=1;$i<39;$i++){
	
	echo"<tr id='tr$i' style='display:none'><td><select name='product$i' id='product$i' onchange='calculate()'>";
echo $productsoptions;
 

	echo "</select></td><td><input onClick='this.select();' name='uprice$i' id='uprice$i' value='0' onkeyup='calculate(1)' onkeypress='onlynumbers(event)' disabled></td>
		  <td><input onClick='this.select();' name='q$i' id='q$i' value='1' onkeyup='calculate(1)' onkeypress='onlynumbers(event)' style='width:100px;' disabled></td>
		<td><input name='price$i' id='price$i' value='0' disabled></td>
		<td><a href='#'' onclick='removetr($i)'><img src='img/remove.png' width='25'></a></td></tr>";
}
		?>
<tr><td align="left">
		<div id="pluslogo"><input type='hidden' id='trn' value='1'><a href="#" onclick="addproduct(1,'<?php echo $ot; ?>')"><img src="img/plus.png" width="30"></a><input type="hidden"  name="activefield" id="activefield" value="0:"></div>
		</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>Total:</td><td><input name="total" id="total" value="0" disabled></td></tr>

			<tr><td></td><td></td><td>Versement: </td><td><input name="versement" id="versement" value="0" onkeypress="onlynumbers(event)" ></td></tr>
		</table>

		<br><br><br><br><br><div align="center"><a href="#" onclick="validate()"><img type="submit" src="img/save.png" width="50"></a></div>
		<!-- <tr><td>eee</td><td>eee</td><td>eee</td><td>eee</td><td>eee</td><td>eee</td><td>eee</td></tr>-->
		<?php echo "<input type='hidden' name='operationtype' value='$ot'>";
				echo "<input type='hidden' name='totala' id='totala' value='0'>"; ?>
</form>
</body></html>
<?php
}
?>