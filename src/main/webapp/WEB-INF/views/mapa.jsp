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
  	
  	var mytext = 'Infowindow contents in HTML'
	var myinfowindow = new google.maps.InfoWindow({
	    content: mytext
	});
  	
		
  	var marker = new google.maps.Marker({position: {lat: duzina, lng: sirina},
  	      map: map,
  	      title: reg + " ",
  	      infowindow: myinfowindow
  	    });
  	
  	
	marker.id = reg;
  	markers.push(marker);
  </c:forEach>
  
  var i = 0;
  <c:forEach items="${userFormMapa}" var="vozilo">
  
  	var contentString = '<p>Registarska oznaka: ' +
  	'<c:out value="${vozilo.registarskaOznaka}"/>' +
  	'<br />' + 
  	'Model: ' +
  	'<c:out value="${vozilo.model}"/>' + 
	'<br />' + 
	'Proizvodjac: ' + 
	'<c:out value="${vozilo.markaVozila}"/>' + 
	'<br />' +
	'Godina proizvodnje: ' +
	'<c:out value="${vozilo.godiste}"/>' + 
	'</p>';
	
	var infowindow = new google.maps.InfoWindow({
	    content: contentString
	  });
	
	markers[i].infowindow = infowindow;
	
	google.maps.event.addListener(markers[i], 'click', function() {
        this.infowindow.open(map, this);
      });
	
	i = i + 1;
  
  </c:forEach>
  //autoRefresh(map);
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

function moveMarker(map, marker, latlng) {
	marker.setPosition(latlng);
	//map.panTo(latlng);
};

function autoRefresh(map) {
	var i, route, marker, j;
	//if (marker.map != null) {
		/*route = new google.maps.Polyline({
			path: pathCoords,
			geodesic : true,
			strokeColor: '#FF0000',
			strokeOpacity: 1.0,
			strokeWeight: 2,
			editable: false,
			map:map
		});*/
		
		for (i = 0; i < pathCoords.length; i++) {
			setTimeout(function()
			{
				for(j = 0; j < markers.length; j++)
				{
					var lat = markers[j].getPosition().lat();
					var lng = markers[j].getPosition().lng();
					if(j % 2 == 0)
					{
						lat = lat + 0.001;
						lng = lng + 0.001;
					}
					else 
					{
						lat = lat - 0.001;
						lng = lng - 0.001;
					}
					var latlng = new google.maps.LatLng(lat, lng);	
					moveMarker(map, markers[j], latlng);
				}
			}, 400 * i);
		}
	//}
}

function prikaziKretanje() {
	autoRefresh(map);
}

google.maps.event.addDomListener(window, 'load', initialize);

var pathCoords = [
	      			{
	      			"lat": 43.832161, 
	      			"lng": 18.308726
	      			},
	      			{
	      			"lat": 43.833585, 
	      			"lng": 18.311301
	      			},
	      			{
	          		"lat": 43.833585, 
	          		"lng": 18.311301
	          		},
	          		{
	        		"lat": 43.835214, 
	        		"lng": 18.315537
	        		},
	        		{
	        		"lat": 43.837659, 
	        		"lng": 18.317682
	        		},
        			{
        			"lat": 43.840631, 
        			"lng": 18.321759
        			},
        			{
        			"lat": 43.842488,
        			"lng": 18.327081
        			},
        			{
        			"lat": 43.845088, 
        			"lng": 18.340127
        			},
        			{
        			"lat": 43.845893,
        			"lng": 18.345964
        			},
        			{
        			"lat": 43.848121, 
        			"lng": 18.360383
        			},
        			{
        			"lat": 43.848523,  
            		"lng": 18.366949
        			},
        			{
        			"lat": 43.846697, 
        			"lng": 18.367335
        			},
        			{
        			"lat": 43.844438, 
        			"lng": 18.368065
        			},
        			{
        			"lat": 43.845614, 
        			"lng": 18.372271
        			},
        			{
        			"lat": 43.846326,
        			"lng": 18.376434
        			}	
      		];

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
	
	#floatingPanel {
		position: absolute;
        top: 32%;
        left: 55%;
        z-index: 5;
        background-color: #fff;
        padding: 0px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;   
	}
	
	#floatingPanel input {
		width: auto;
		min-height: 20px;
		height:auto;
		padding: 5px;
	}
	
</style>

</head>
<body>
 <div id="wrap">
    <div id="regbar">
      <div id="navthing">
        <h2><a href="unosVozila" id="unosvozilaform">Unos vozila</a> | <a href="mojaVozila" id="mojavozilaform">Moja vozila</a> | <a href="mapa" id="mapaform" style="color: red">Mapa</a> | <a href="odjava" id="odjavaform">Odjava</a></h2>
    
    <div id="logo">
      <img src="resources/tracking.png" alt="logo">
      <p>GPSTrackingVozila.ba</p>
    </div>
 
 <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

     <script src="resources/js/index.js"></script>
 	</div>
  </div>
  <div id="floatingPanel">
  	<input type="submit" value="Prikazi kretanje vozila" onclick="prikaziKretanje()">
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