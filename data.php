<?php
session_start();
?>
 <html><head>
        <link href="css/style2.css" type="text/css" rel="stylesheet"/>
        </head><body>
        <div align="center">
<?php
if (isset($_SESSION['lg']) AND $_SESSION['lg']==2){
    include_once ('database_connection.php');
    if(isset($_POST['du'])){
        $du =     trim($_POST['du']) ;
        $au =     trim($_POST['au']) ;
        if($du=strtotime($du) AND $au=strtotime($au)){
            $au+=82800;

            ?>

            <form autocomplete='off' name="dataform" id="dataform" method="POST" action="data.php">
            <table id="dates">
            <tr valign="middle"><td valign="middle"><font size=6 color="black">Entre le : </td>
            <td valign="middle"><input type="text" value="<?php echo date('d-m-Y', $du)  ?>"name="du"></td><td rowspan=2 align="center"><input value="Calculer" type="submit"></td></tr>
            <tr><td><font size=6 color="black">Et le : </td><td><input type="text" name="au" value="<?php echo date('d-m-Y', $au); ?>"></td></tr>
            </table>
            </form><table>
            <?php 
        
//valid orders
            $query = "SELECT COUNT(id) as count,sum(b) as b,sum(ABS(price)) as price,AVG(ABS(price))  as avrgprice, MAX(price)  as maxp , MAX(b)  as maxb, MAX(b/ABS(price))  as maxbp  FROM orders WHERE status!='0' AND time>$du AND time<$au";
            $result = mysqli_query($dbc,$query);
            if($result){
            $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
            $numberOfOrders=$row['count'];
            $ball=$row['b'];
            $priceall=$row['price'];
            $avrgpriceall=$row['avrgprice'];
            $maxpriceall=$row['maxp'];
            $maxball=$row['maxb'];
            $maxbpall=$row['maxbp']*100;
            }

//gros
            $query = "SELECT COUNT(id) as count,sum(b) as b,sum(price) as price, AVG(b/price) as avrgbp  FROM orders WHERE operation_type='Gros' AND status!='0' AND time>$du AND time<$au";
            $result = mysqli_query($dbc,$query);
            if($result){
            $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
            $numberOfOrdersgros=$row['count'];
            $bgros=$row['b'];
            $pricegros=$row['price'];
            $avrgbpgros=$row['avrgbp']*100;
            }

//detail
            $query = "SELECT COUNT(id) as count,sum(b) as b,sum(price) as price, AVG(b/price) as avrgbp  FROM orders WHERE operation_type='Detail' AND status!='0' AND time>$du AND time<$au";
            $result = mysqli_query($dbc,$query);
            if($result){
            $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
            $numberOfOrdersdetail=$row['count'];
            $bdetail=$row['b'];
            $pricedetail=$row['price'];
            $avrgbpdetail=$row['avrgbp']*100;
            }

//achat
            $query = "SELECT COUNT(id) as count,sum(price) as price  FROM orders WHERE operation_type='Achat' AND status!='0' AND time>$du AND time<$au";
            $result = mysqli_query($dbc,$query);
            if($result){
            $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
            $numberOfOrdersachat=$row['count'];
            $priceachat=$row['price']*(-1);
            }

//Canceled orders
            $query = "SELECT COUNT(id) as count FROM orders WHERE status='0' AND time>$du AND time<$au";
            $result = mysqli_query($dbc,$query);
            $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
            $numberOfCanceledOrders=$row['count'];



echo "<br><br><table id='datatable'style='font-size:22px;'><tr><td colspan='3' align='center'><b>General</b></td></tr>
<tr><td colspan='3'><table align='center'  style='font-size:22px;'><tr><td>
Nombre de bons: $numberOfOrders<br>
Nombre de bons annul&eacute;s: $numberOfCanceledOrders<br>
Chiffre d'affaire : ". number_format($priceall,2,'.',' ')." DA<br>
Benefice : ". number_format($ball,2,'.',' ')." DA<br><br><br></td><td>
Max Montant : ". number_format($maxpriceall,2,'.',' ')." DA<br>
Bon moyen : ". number_format($avrgpriceall,2,'.',' ')." DA<br>
Max Benefice : ". number_format($maxball,2,'.',' ')." DA<br>
Max Benefice : $maxbpall %<br><br><br></td></tr></table></td></tr>
<tr><td align='center'><b>Detail</b></td><td align='center'><b>Gros</b></td><td align='center'><b>Achat</b></td></tr>

<tr>

<td>
Nombre de bons: $numberOfOrdersdetail<br>
Somme des bons : ". number_format($pricedetail,2,'.',' ')." DA<br>
Benefice : ". number_format($bdetail,2,'.',' ')." DA<br>
Benefice moyen : $avrgbpdetail%<br></td>

<td>
Nombre de bons: $numberOfOrdersgros<br>
Somme des bons : ". number_format($pricegros,2,'.',' ')." DA<br>
Benefice : ". number_format($bgros,2,'.',' ')." DA<br>
Benefice moyen : $avrgbpgros %<br></td>

<td>
Nombre de bons: $numberOfOrdersachat<br>
Somme des bons : ". number_format($priceachat,2,'.',' ')." DA<br><br><br>


</td></tr></table>


";


         






        }else{ // date error
            $avant=time()-2592000;
            $avant=date('d-m-Y', $avant);
            echo 'Date erronée!';
            ?>
            <form autocomplete='off' name="dataform" id="dataform" method="POST" action="data.php">
            <table id="dates">
            <tr valign="middle"><td valign="middle"><font size=6 color="black">Entre le : </td>
            <td valign="middle"><input type="text" value="<?php echo $avant;   ?>"name="du"></td><td rowspan=2 align="center"><input value="Calculer" type="submit"></td></tr>
            <tr><td><font size=6 color="black">Et le : </td><td><input type="text" name="au" value="<?php echo date("d-m-Y"); ?>"></td></tr>
            </table>
            </form>

            <?php

        }
    }else{   //no POST
        $avant=date("d-m-Y");
        $avant=strtotime($avant);
        $avant=$avant-2592000;
        $avant=date('d-m-Y', $avant);
    ?>
        <form autocomplete='off' name="dataform" id="dataform" method="POST" action="data.php">
        <table id="dates">
        <tr valign="middle"><td valign="middle"><font size=6 color="black">Entre le : </td>
            <td valign="middle"><input type="text" value="<?php echo $avant;   ?>"name="du"></td><td rowspan=2 align="center"><input value="Calculer" type="submit"></td></tr>
        <tr><td><font size=6 color="black">Et le : </td><td><input type="text" name="au" value="<?php echo date("d-m-Y"); ?>"></td></tr>
        </table>
        </form>

        <?php
    }

}else{
    echo'<script type="text/javascript">window.top.location.reload();</script>';
}
?>
</div>
        </body>
       </html>