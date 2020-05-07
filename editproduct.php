<?php
session_start();
?>
<html><head>

<link href="css/style2.css" type="text/css" rel="stylesheet"/>
<?php
if (isset($_SESSION['lg']) AND $_SESSION['lg']==2){
	include_once ('database_connection.php');

	if (isset($_POST['designation'])){
    $reference =  trim($_POST['reference']) ;
$reference = mysqli_real_escape_string($dbc, $reference);
$reference = htmlentities($reference);
$reference = preg_replace("`'`",'’',$reference);

$designation =  trim($_POST['designation']) ;
$designation = mysqli_real_escape_string($dbc, $designation);
$designation = htmlentities($designation);
$designation = preg_replace("`'`",'’',$designation);

$pricea =   trim($_POST['pricea']) ;
$pricea = mysqli_real_escape_string($dbc, $pricea);
$pricea = htmlentities($pricea);

$priced =  trim($_POST['priced']) ;
$priced = mysqli_real_escape_string($dbc, $priced);
$priced = htmlentities($priced);

$priceg =  trim($_POST['priceg']) ;
$priceg = mysqli_real_escape_string($dbc, $priceg);
$priceg = htmlentities($priceg);

$q =  trim($_POST['q']) ;
$q = mysqli_real_escape_string($dbc, $q);
$q = htmlentities($q);

$idp =  trim($_POST['idproduct']) ;

if(mysqli_query($dbc,"UPDATE products SET reference='$reference', designation='$designation', pricea='$pricea', priceg='$priceg', priced='$priced', q='$q' WHERE id='$idp' ")){
echo '<div id="added" align="center">Produit modifi&eacute;! </div>';
}else{
	echo "<div id='error' align='center'>Une erreur s&#39;est produite </div>";
  echo mysqli_error($dbc);
}
	}

  if (isset($_GET['idproduct']) OR isset($_POST['idproduct'])){
    if (isset($_GET['idproduct'])){
    $idp=$_GET['idproduct'];
  }else{
    $idp=$_POST['idproduct'];
  }
		echo'<script type="text/javascript">
		    	function isInArray(array, search){
    return array.indexOf(search) >= 0;
}
var references=[];var designations=[];';

		$query1="select * from products WHERE WHERE type!=0 OR id!=$idp";
		$result1 = mysqli_query($dbc,$query1);
		if($result1){
		    if(mysqli_affected_rows($dbc)!=0){
		    	
		    	$i=0;
		    	while($row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC)){
		    	echo 'references['.$i.']="'. stripslashes($row1['reference']) .'";';
		    	echo 'designations['.$i.']="'. stripslashes($row1['designation']) .'";';
$i++;
		    }
		    
		}}
		    
		    ?>

	

function onlynumbers(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  if ((key < 48 || key > 57) && !(key == 8 || key == 9 || key == 13 || key == 37 || key == 46) ){
    theEvent.returnValue = false;
    if (theEvent.preventDefault) theEvent.preventDefault();
  }}
  function noquot(evt) {
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

function valider() {
  if(document.addproduct.reference.value != "") {
    valider2();
  }else {
    alert("Vous devez introduir une reference");
  }}

function valider2() {
  if(document.addproduct.designation.value != "") {
    valider3();
  }
  else {
    alert("Vous devez introduir une designation");
  }}
function valider3() {
  if(document.addproduct.pricea.value != "" || document.addproduct.priceg.value != "" || document.addproduct.priced.value != "") {
 valider4();
  }
  else {
    alert("Vous devez introduir les prix");
  }}

function valider4() {
var s=htmlEntities(document.addproduct.designation.value);
  if(isInArray(designations, s)){
  alert("Un produit portant la meme designation existe deja");
}else{
  valider5();}}

function valider5() {
var s=htmlEntities(document.addproduct.reference.value);
  if(isInArray(references, s)){
  alert("Un produit portant la meme reference existe deja");
}else{
  document.addproduct.submit();}}
function htmlEntities(str) {
    
    return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/é/g, '&eacute;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}


function del(id){
  var r=confirm("Voulez vous supprimer ce produit?");
  if(r){
    window.location.href ='delproduct.php?id='+id;
  }

}
</script>
</head><body>
<?php
$query2="select * from products WHERE id=$idp";
    $result2 = mysqli_query($dbc,$query2);
    if($result2){
        if(mysqli_affected_rows($dbc)!=0){

      $row2 = mysqli_fetch_array($result2,MYSQLI_ASSOC);
$reference=$row2['reference'];
$designation=$row2['designation'];
$producttype=$row2['type'];
$pricea=$row2['pricea'];
$priceg=$row2['priceg'];
$priced=$row2['priced'];
$q=$row2['q'];

?>
<form autocomplete='off' method="post" name="addproduct">
<table id="addproducttable" align="center">
<tr valign="iddle"><td valign="middle">Reference: </td><td valign="middle"><input type="text" value='<?php echo $reference; ?>' name="reference" ></td></tr>
<tr valign="iddle"><td valign="middle">D&eacute;signation: </td><td valign="middle"><input type="text" value='<?php echo $designation; ?>' name="designation"></td></tr>
<tr valign="iddle"><td valign="middle">Prix d&#39;Achat: </td><td valign="middle"><input type="text" name="pricea" value='<?php echo $pricea; ?>' onkeypress="onlynumbers(event)" ></td></tr>
<tr valign="iddle"><td valign="middle">Prix de Gros : </td><td valign="middle"><input type="text" name="priceg" value='<?php echo $priceg; ?>'onkeypress="onlynumbers(event)" ></td></tr>
<tr valign="iddle"><td valign="middle">Prix de D&eacute;tail: </td><td valign="middle"><input type="text" value='<?php echo $priced; ?>' name="priced" onkeypress="onlynumbers(event)" ></td></tr>
<tr valign="iddle"><td valign="middle">Quantité: </td><td valign="middle" onkeypress="onlynumbers(event)" ><input value='<?php echo $q; ?>'type="text" name="q">
  <input value='<?php echo $idp; ?>' type="hidden" name="idproduct"></td></tr>

<tr><td colspan="2" align="center"><br><a href="#" onclick="valider()">
  <div class="menu">
    Enregistrer</div></a></td></tr></table>
</form>

</body></html>
<?php
}}
}}else{
	echo'<script type="text/javascript">window.top.location.reload();</script>';
}
?>