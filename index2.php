<?php
Session_start();

error_reporting(E_ALL ^ E_DEPRECATED);
// include_once ('save.php');
if (isset($_GET['pw']) AND $_GET['pw']=="password"){
$_SESSION['lg'] = 1;
setcookie("lgg", 1, time()+3600);
$access=1;
?>
<script type="text/javascript"> window.location.href ='index.php';
</script>
<?php
}elseif(isset($_GET['dec'])){
session_unset ();  
session_destroy();
setcookie("lgg", 5, time()-3600);
$dec=1;
}
?>
<html>
<head><title>AMA</title>
<link rel='shortcut icon' type='image/x-icon' href='/favicon.ico' />
<link href="css/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/jquery.watermark.js"></script>
<script type="text/javascript">
 
 function premium()
{
var x;

var pw=prompt("Mot de passe :","");

if (name!=null)
  {
   window.location.href ='index.php?pw='+pw;
  }
}

      $(document).ready(function() {

$("#faq_search_input").watermark("Recherche Produits");
$("#faq_search_input").keyup(function()
{
var faq_search_input = $(this).val();
var dataString = 'keyword='+ faq_search_input;
if(faq_search_input.length>0)

{	
$.ajax({
type: "GET",
url: "ajax-search.php",
data: dataString,

success: function(server_response)
{

$('#searchresultdata').html(server_response).show();


}
});
}
});
});

// click on the div
function toggle( e, id ) {
  var el = document.getElementById(id);
  el.style.display = ( el.style.display == 'none' ) ? 'block' : 'none';
  // save it for hiding
  toggle.el = el;

  // stop the event right here
  if ( e.stopPropagation )
    e.stopPropagation();
  e.cancelBubble = true;
  return false;
}

// click outside the div
document.onclick = function() {
  if ( toggle.el ) {
    toggle.el.style.display = 'none';
  }
}

var closeIFrame = function() {
     $('#iframe1').remove();
}
 function Reload (k) {
$("#h").html('<iframe name="hiframe" id="hiframe" src="h.php#btm"></iframe>'); 
toggle('event', 'infop');
var f = document.getElementById('hiframe');
var elem = document.getElementById('faq_search_input');
var dataString = 'keyword='+ k;
$.ajax({
type: "GET",
url: "ajax-search.php",
data: dataString,

success: function(server_response)
{

$('#searchresultdata').html(server_response).show();


}
});
elem.value = k;
f.src = f.src;
}
</script>
</head>
<body>
 
<div id="top"><div id="search">
        

              <div class="faqsearchinputbox">
                <input autocomplete='off' name="query" type="text" id="faq_search_input" />
              </div>
          
            <div id="searchresultdata" class="faq-articles" align="center"><div align=center></div></div>
          
      </div></div>
<div id="menu"><ul>
<a href="#" onclick="toggle(event, 'popaddp');"><img src="ap.png" height="65" width="150" style="border:none;"></a><br><br>
<a href="#" onclick="Reload('@all');"><img src="gp.png" type="submit"height="65" width="150" style="border:none;"></a><br><br>
<table><tr><td style="border:none;">
<form style="margin-bottom:10px;"  action="addb.php" target="addbiframe"><input type="image"  onclick="toggle(event, 'popaddb');" src="bv.png" height="65" width="70"></form>
</td><td style="border:none;">
<form style="margin-bottom:10px;" action="addba.php" target="addbiframe"><input type="image"  onclick="toggle(event, 'popaddb');" src="ba.png" height="65" width="70" ></form>
</td></tr>
<tr><td style="border:none;">
<form style="margin-bottom:10px;" action="gb.php" target="gbiframe"><input type="image" onclick="toggle(event, 'popgb');" src="gbv.png" height="65" width="70"></form>
</td><td style="border:none;">
<form style="margin-bottom:10px;" action="gb.php?f=0" action="get" target="gbiframe"><input type="hidden" name="f" value="0">
<input type="image" onclick="toggle(event, 'popgb');" src="gba.png" height="65" width="70"></form>
</td></tr></table>
<form action="gv.php" target="gviframe"><input type="image" onclick="toggle(event, 'popgv');" src="v.png" height="65" width="150" style="border:none;"></form>
<form action="gc.php" target="gciframe"><input type="image" onclick="toggle(event, 'popgc');" src="gc.png" height="65" width="150" style="border:none;"></form>
<form action="cf.php" target="cfiframe"><input type="image" onclick="toggle(event, 'popcf');" src="cf.png" height="65" width="150" style="border:none;"></form>
</ul></div>

<div id="copyright">Amine: 0664512364</div>
<div id="popaddp" style="display:none"><iframe src="add.php" name="addiframe"></iframe></div>
<div id="popaddb" style="display:none"><iframe src="addb.php" name="addbiframe"></iframe></div>
<div id="infop" style="display:none;"><iframe src="infop.php" id="pinfoiframe"name="pinfoiframe"></iframe></div>
<div id="popgc" style="display:none;"><iframe src="gc.php" id="gciframe"name="gciframe"></iframe></div>
<div id="popgb" style="display:none;"><iframe src="gb.php" id="gbiframe"name="gbiframe"></iframe></div>
<div id="popcf" style="display:none;"><iframe src="cf.php" id="cfiframe"name="cfiframe"></iframe></div>
<div id="popgv" style="display:none;"><iframe src="gv.php" id="gviframe"name="gviframe"></iframe></div>

<div id="historique"></div>
</body>
</html>