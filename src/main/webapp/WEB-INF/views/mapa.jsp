<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Mapa</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
<script  src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
var map;
var markers = [];
function initialize() {
	  var myLatLng = {lat: 43.8563, lng: 18.4131};	
	  var mapOptions = {
	    zoom: 12,
	    center: new google.maps.LatLng(43.8563, 18.4131)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  /*var marker = new google.maps.Marker({position: myLatLng,
      map: map,
      title: 'Hello World!'
    });*/
  <c:forEach items="${userFormMapaKoordinate}" var="koordinate">     
  	// Do something
  	var duzina = <c:out value="${koordinate.duzina}"/>;
  	var sirina = <c:out value="${koordinate.sirina}"/>;
  	var reg = '<c:out value="${koordinate.voziloid}"/>';
  	var marker = new google.maps.Marker({position: {lat: duzina, lng: sirina},
  	      map: map,
  	      title: reg + " "
  	    });
	marker.id = reg;
  	markers.push(marker);
  </c:forEach>
}

function updateMap() {
	for (var i=0; i<markers.length; i++) {
		markers[i].setMap(map);
	}
	var checkBoxValues = [];
	var inputFields = document.getElementsByTagName('input');
	for (var i=0; i<inputFields.length; i++) {
		if(inputFields[i].type =='checkbox' && inputFields[i].checked == true)
			checkBoxValues.push(inputFields[i].value);
			
	}
	for (var j=0; j<markers.length; j++) {
		var index = checkBoxValues.indexOf(markers[j].id);
		if (index == -1) {
			markers[j].setMap(null);
		}
	}
	if (checkBoxValues.length == 0) {
		for (var i=0; i<markers.length; i++) {
			markers[i].setMap(map);
		}
	}
	checkBoxValues = [];
};

google.maps.event.addDomListener(window, 'load', initialize);
</script>

<style type="text/css">
	#vozilaKorisnika {
		position:absolute;
		float:left;
		display:block;
		top:31%;
		margin-left:3%;
		margin-right:5%;
		max-height:400px;
		overflow:auto;
	}
	
	.table-fill {
		  background: white;
		  border-radius:3px;
		  border-collapse: collapse;
		  height: auto;
		  max-height:500px;
		  margin: auto;
		  /*max-width: 900px;*/
		  padding:10px;
		  width: 100%;
		  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
		  animation: float 5s infinite;
		}
 
		th {
		  color:#D5DDE5;;
		  background:#1b1e24;
		  border-bottom:4px solid #9ea7af;
		  border-right: 1px solid #343a45;
		  font-size:20px;
		  font-weight: 100;
		  padding:10px;
		  text-align:left;
		  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
		  vertical-align:middle;
		}
		

		th:first-child {
		  border-top-left-radius:3px;
		}
		 
		th:last-child {
		  border-top-right-radius:3px;
		  border-right:none;
		}
  
		tr {
		  border-top: 1px solid #C1C3D1;
		  border-bottom-: 1px solid #C1C3D1;
		  color:#666B85;
		  font-size:15px;
		  font-weight:normal;
		  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
		}
		 
		tr:hover td {
		  background:#4E5066;
		  color:#FFFFFF;
		  border-top: 1px solid #22262e;
		  border-bottom: 1px solid #22262e;
		}
 
		tr:first-child {
		  border-top:none;
		}
		
		tr:last-child {
		  border-bottom:none;
		}
		 
		tr:nth-child(odd) td {
		  background:#EBEBEB;
		}
		 
		tr:nth-child(odd):hover td {
		  background:#4E5066;
		}

		tr:last-child td:first-child {
		  border-bottom-left-radius:3px;
		}
		 
		tr:last-child td:last-child {
		  border-bottom-right-radius:3px;
		}
 
		td {
		  background:#FFFFFF;
		  padding:10px;
		  text-align:center;
		  vertical-align:middle;
		  font-weight:300;
		  font-size:18px;
		  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
		  border-right: 1px solid #C1C3D1;
		}
		
		td:last-child {
		  border-right: 0px;
		}
		
		th.text-left {
		  text-align: left;
		  width: 150px;
		}

		th.text-center {
		  text-align: center;
		  width: 150px;
		  max-width: 150px;
		}
		
		th.text-right {
		  text-align: right;
		}
		
		td.text-left {
		  text-align: left;
		}
		
		td.text-center {
		  text-align: center;
		}

		td.text-right {
		  text-align: right;
		}
	
	#map-canvas {
		position: absolute;
		display: block;
		height:400px; 
		/*width:700px;*/
		width:60%; 
		/*margin-top:6%; 
		margin-left: 25%";*/
		top:31%;
		left:30%;
	}
	
</style>

</head>
<body>
 <div id="wrap">
    <div id="regbar">
      <div id="navthing">
        <h2><a href="unosVozila" id="unosvozilaform">Unos vozila</a> | <a href="mojaVozila" id="mojavozilaform">Moja vozila</a> | <a href="#" id="servisiform">Servisi</a> | <a href="mapa" id="mapaform" style="color: red">Mapa</a> | <a href="odjava" id="odjavaform">Odjava</a></h2>
    
    <div id="logo">
      <img src="resources/tracking.png" alt="logo">
      <p>GPSTrackingVozila.ba</p>
    </div>
 
 <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

     <script src="resources/js/index.js"></script>
 	</div>
  </div>
  
  <div id="map-canvas"></div>
  <div id="vozilaKorisnika">
  <table class="table-fill">
				<thead>
					<tr>
						<th class="text-left">Registracija</th>
						<th class="text-center"></th>
					</tr>
				</thead>
				<tbody class="table-hover">
					<c:forEach items="${userFormMapa}" var="vozilo">
							<tr>
							 <td class="text-left"><input type="hidden" name="registarskaOznaka" value="${vozilo.registarskaOznaka}"><c:out value="${vozilo.registarskaOznaka}" /></td>
							 <td><input type="checkbox" name="registarskeOznake" value="${vozilo.registarskaOznaka}" onchange="updateMap()"></td>
							</tr>

					</c:forEach>
				</tbody>
  </table>
  <input type="hidden" id="koordinate" value='${userFormMapaKoordinate}'/>
  </div>
 </div>
</body>
</html>