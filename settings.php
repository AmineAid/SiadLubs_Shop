<?php
session_start();
$maxi=0;
?>
 <html><head>
        <link href="css/style2.css" type="text/css" rel="stylesheet"/>
        <script type="text/javascript">
        function onlynumbers(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  if ((key < 48 || key > 57) && !(key == 8 || key == 9 || key == 13 || key == 37 || key == 46) ){
    theEvent.returnValue = false;
    if (theEvent.preventDefault) theEvent.preventDefault();
  }}
  </script>
        </head><body>
        <div align="center">
<?php
if (isset($_SESSION['lg']) AND $_SESSION['lg']==2){
    include_once ('database_connection.php');





            $query4 = "SELECT * FROM products WHERE type!=0 ORDER BY id";
                $result4 = mysqli_query($dbc,$query4);
                if($result4){                
                if(mysqli_affected_rows($dbc)!=0){
                $maxi=mysqli_affected_rows($dbc);            
                $i=1;

            echo "<div align='center'> <form name='products1' method='POST'> <table id='settingstable'><tr><td colspan='5' align='center'><h2><br>Liste des produits</br></h2></td></tr>
            <tr><td align='center'>Reference</td><td align='center'>D&eacute;signation</td>
            <td align='center'>Prix Achat</td><td align='center'>Prix De Gros</td><td align='center'>Prix De D&eacute;tail</td>
            </tr>";

                while($row4 = mysqli_fetch_array($result4,MYSQLI_ASSOC)){
                $productid=$row4['id'];
                $reference=$row4['reference'];
                $designation=$row4['designation'];
                $priced=$row4['priced'];
                $priceg=$row4['priceg'];
                $pricea=$row4['pricea'];
                echo"<tr>
                <td><input name='id1".$i."' value='$productid' type='hidden'><a href='editproduct.php?idproduct=$productid'>$reference</a></td>
                <td><a href='editproduct.php?idproduct=$productid'>$designation</a></td>
                <td><a href='editproduct.php?idproduct=$productid'>$pricea</a></td>
                <td><a href='editproduct.php?idproduct=$productid'>$priceg</a></td>
                <td><a href='editproduct.php?idproduct=$productid'>$priced</a></td>
                ";
$i++;
}}}

echo "<input name='maxi1' value='$maxi' type='hidden'></table></form>";





}?>

</div>
        </body>
       </html>