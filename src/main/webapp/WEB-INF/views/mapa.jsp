<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Mapa</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
<script
    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
var map;
function initialize() {
  var myLatLng = {lat: 43.8563, lng: 18.4131};	
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(43.8563, 18.4131)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  var marker = new google.maps.Marker({position: myLatLng,
      map: map,
      title: 'Hello World!'
    });
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
 <div id="wrap">
    <div id="regbar">
      <div id="navthing">
        <h2><a href="unosVozila" id="unosvozilaform" style="color: red">Unos vozila</a> | <a href="mojaVozila" id="mojavozilaform">Moja vozila</a> | <a href="#" id="servisiform">Servisi</a> | <a href="mapa" id="mapaform">Mapa</a> | <a href="odjava" id="odjavaform">Odjava</a></h2>
    
    <div id="logo">
      <img src="resources/tracking.png" alt="logo">
      <p>GPSTrackingVozila.ba</p>
    </div>
 
 <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

     <script src="resources/js/index.js"></script>
 	</div>
  </div>
  <div id="map-canvas" style="height:500px; width:700px; margin-top:6%; margin-left: 25%"></div>
 </div>
</body>
</html>