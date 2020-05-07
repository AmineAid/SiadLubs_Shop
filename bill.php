<?php
include_once ('database_connection.php');
if(isset($_GET['id']) AND $_GET['id']>0) {
$orderid=$_GET['id'];
    $query1="select * from orders WHERE id='$orderid'";
    $result1 = mysqli_query($dbc,$query1);
    if($result1){
        if(mysqli_affected_rows($dbc)!=0){
            while($row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC)){


$clientid=$row1['contact_id'];
             $query2="select com from contacts WHERE id='$clientid'";
            $result2 = mysqli_query($dbc,$query2);
            $row2 = mysqli_fetch_array($result2,MYSQLI_ASSOC);
            $adresse=$row2['com'];
            $client=$row1['contact_name'];
    $date=date("d-m-Y",$row1['time']);
    $fnumber=$row1['id'];

           }}else{ die("Numero de commande erroné");}
       }

echo"<br><br><br><form method='post' action='bill.php'><input type='hidden' name='id' value='$orderid'><table style='font-size:18px;'align=center>
<tr><td>DATE:</td><td><input name='date' value='$date' autocomplete='off'></td></tr>
<tr><td>REGLEMENT:</td><td><input name='reglement' value='CHEQUE' autocomplete='off'></td></tr>
<tr><td>FACTURE N&deg;:</td><td><input name='fnumber' value='' autocomplete='off'></td></tr>
<tr><td>CLIENT:</td><td><input name='client' value='$client' autocomplete='off'></td></tr>
<tr><td>ADRESSE</td><td><input name='adresse' value='$adresse' autocomplete='off'></td></tr>
<tr><td>RC N&deg;</td><td><input name='rc' autocomplete='off'></td></tr>
<tr><td>MF N&deg;</td><td><input name='mf' autocomplete='off'></td></tr>
<tr><td>AI N&deg;</td><td><input name='ai' autocomplete='off'></td></tr>
<tr><td colspan='2' align='center'><br><input type='submit' value='GENERER'></td></tr>
</table></form>";


}elseif(isset($_POST['id']) AND $_POST['id']>0){
    $date=$_POST['date'];
    $reglement=$_POST['reglement'];
    $fnumber=$_POST['fnumber'];
    $client=$_POST['client'];
    $adresse=$_POST['adresse'];
    $rc=$_POST['rc'];
    $mf=$_POST['mf'];
    $ai=$_POST['ai'];
    $orderid=$_POST['id'];

    
                    
    ?><html><head>
<link href="css/style3.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript">
function printdiv(a)
{
 
window.print();
return false;
}
window.onload = printdiv();
</script>
</head><body>

<div id="fiche">

    <div align="center">
        
        

    
    <table border="1" style="width:100%; border-collapse:collapse;" ><tr><td>
        <div align="center">
<b style="font-size:20px;"> MIMA LUBRIFIANTS </b><br>
<b style="font-size:16px;"> SIAD MOHAMED </b><br><br>
<i>Pi&eacute;ces D&eacute;tach&eacute;es - Accessoires Auto - Lubrifiants et Graisses Industrielles - Pneumatiques - Batteries</i><br>
<font style="font-size:16px;">AZAZGA 15300, W. TIZI-OUZOU</font><br><br>
RC N&deg;:&#160;&#160;&#160;&#160;<b>15/00-5510341 A 17</b> &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
MF N&deg;:&#160;&#160;&#160;&#160;<b>197615180133825</b>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
AI N&deg;:&#160;&#160;&#160;&#160;<b>15180291916</b>
</div>
    </td></tr></table>
<br>

<div align="right">
    <u><b>AZAZGA LE : <?php echo $date; ?> </b></u><br><br>
    <div style="width:50%; border:2px solid black; border-radius:10px;padding:5px 20px;">
        <div align="left" style="font-size:17px;">
 <b>DOIT A: <?php echo $client; ?><br>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<?php echo $adresse; ?></b>
<br>
RC N&deg;:&#160;&#160;&#160;&#160;<?php echo $rc; ?> <br>
MF N&deg;:&#160;&#160;&#160;&#160;<?php echo $mf; ?><br>
AI N&deg;:&#160;&#160;&#160;&#160;<?php echo $ai; ?>
</div></div>
    </div>
    <br>

   
    <div style="width:30%; border:2px solid black; border-radius:10px;padding:5px 20px;">
        <div align="left" style="font-size:16px;">
 <b>FACTURE N&deg;: <?php echo $fnumber; ?></b>
</div></div>
    


                    <table id="articlestable2" style="width:90%; margin-top:20px;" ><tr id="tablemenu">


                    <td>N&deg; </td><td style='width:340px;'>D&eacute;signation</td><td>Prix Unitaire</td><td>Quantit&eacute;</td><td>Montant</td></tr>
                    

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
                    $uprice2=number_format($uprice,2,'.',' ');
                    $price=$row5['price'];
                    $price2=number_format($price,2,'.',' ');

echo "<tr><td>". $i ."</td><td>". $product_name ."</td><td>". $uprice2 ."</td>
<td>". $q ."</td><td>". $price2 ."</td></tr>";
        $totalorder+=$price;
        $i++;



}}}
$totalorder2=number_format($totalorder,2,'.',' ');
while ( $i<= 10) {
echo "<tr><td>&#160;</td><td></td><td></td><td></td><td></td></tr>";
$i++;
}
echo "<tr><td style='border:0px;'></td><td style='border:0px;'></td><td style='border:0px;'></td><td>Total</td><td>$totalorder2</td></tr>";


echo "</table>";





echo "<br><br>";
include_once("chifre_en_lettre.php");
?>
<br>
<div align="left">R&eacute;glement: <?php echo $reglement; ?><br><br>
    Facture arr&ecirc;t&eacute;e &agrave; la somme de :<br>
   <?php 
    echo "<b><i>".chifre_en_lettre($totalorder)."</i></b>";
    ?>
</div>
<div align="center">
<div style="position: absolute;
    bottom: 0; left:0;right:0;">BD HADDAG MOHAND AMOKRANE AZAZGA 15300 - TIZI-OUZOU<br>TEL: 0556-40-60-40 / 0541-84-05-61 / 0561-02-83-28</div>
<?php
echo "</div></div>";
}
?>
</body></html>