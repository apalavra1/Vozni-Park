<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>Moja vozila</title>
  <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
  <style type="text/css">
	  	
	  	div.table-title {
		   display: block;
		  margin: auto;
		  max-width: 600px;
		  padding:5px;
		  width: 100%;
		}

		.table-title h3 {
		   color: #fafafa;
		   font-size: 30px;
		   font-weight: 400;
		   font-style:normal;
		   font-family: "Roboto", helvetica, arial, sans-serif;
		   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
		   text-transform:uppercase;
		}


		/*** Table Styles **/

		.table-fill {
		  background: white;
		  border-radius:3px;
		  border-collapse: collapse;
		  height: auto;
		  max-height:500px;
		  margin: auto;
		  max-width: auto;
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
		  text-align:left;
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
		
		#formVozila {
			position: absolute;
			top: 27%;
			left: 25%;
		}
		
		#obrisiBtn {
			margin-left: 25%;
			margin-top: 50px;
			background: #C80000;
			padding: 10px;
			font-size: 20px;
			display: block;
			width: 50%;
			border: none;
			color: #fff;
			border-radius: 5px;
		}
		
		#obrisiBtn:hover {
			background: #E00000;
		}
		
		#editBtn {
			 background: #1abc9c;
			 padding: 2px;
			 font-size: 16px;
			 display: block;
			 text-align: center;
			 height: 30px;
			 width: 150px;
			 border: none;
			 color: #fff;
			 border-radius: 1px;
		}
		
		
  </style>
</head>
<body>
  <div id="wrap">
    <div id="regbar">
      <div id="navthing">
        <h2><a href="unosVozila" id="unosvozilaform">Unos vozila</a> | <a href="#" id="mojavozilaform" style="color: red">Moja vozila</a> | <a href="#" id="servisiform">Servisi</a> | <a href="#" id="mapaform">Mapa</a> | <a href="odjava" id="odjavaform">Odjava</a></h2>
      
    
    <div id="logo">
      <img src="resources/tracking.png" alt="logo">
      <p>GPSTrackingVozila.ba</p>
    </div>
	
	<div id="formVozila">
	    <form:form action="obrisiVozila" method="post" commandName="obrisiMojaVozila">
		    <div id="tabelaVozila">
			<table class="table-fill">
				<thead>
					<tr>
						<th class="text-left">Registracija</th>
						<th class="text-left">Model</th>
						<th class="text-center">Servisni interval (kilometri)</th>
						<th class="text-center">Servisni interval (mjeseci)</th>
						<th class="text-left">Proizvodjac</th>
						<th class="text-center">Godina proizvodnje</th>
						<th></th>
						<th class="text-center"></th>
					</tr>
				</thead>
				<tbody class="table-hover">
					<c:forEach items="${userFormMojaVozila}" var="vozilo">
							<tr>
							 <td class="text-left"><input type="hidden" name="registarskaOznaka" value="${vozilo.registarskaOznaka}"><c:out value="${vozilo.registarskaOznaka}" /></td>
							 <td class="text-left"><c:out value="${vozilo.model}" /></td>
						     <td class="text-right"><c:out value="${vozilo.serviskm}" /></td>
							 <td class="text-right"><c:out value="${vozilo.servismj}" /></td>
						     <td class="text-left"><c:out value="${vozilo.markaVozila}" /></td>
							 <td class="text-right"><c:out value="${vozilo.godiste}" /></td>
							 <td><input type="checkbox" name="registarskeOznake" value="${vozilo.registarskaOznaka}"></td>
							 <td class="text-left"><a href="<c:url value='edit/${vozilo.registarskaOznaka}'/>" id="editBtn">Uredi</a></td>
							</tr>

					</c:forEach>
				</tbody>
			</table>
			</div>
			<input id="obrisiBtn" type="submit" name="obrisi" value="Obrisi oznacena vozila">
		</form:form>
    </div> 
    </div>
  </div>
  </div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  	
</body>
</html>