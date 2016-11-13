<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>Unos vozila</title>
  <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
</head>
<body>
  <div id="wrap">
    <div id="regbar">
      <div id="navthing">
        <h2><a href="#" id="unosvozilaform" style="color: red">Unos vozila</a> | <a href="#" id="mojavozilaform">Moja vozila</a> | <a href="#" id="servisiform">Servisi</a> | <a href="#" id="mapaform">Mapa</a> | <a href="#" id="odjavaform">Odjava</a></h2>
      
    
    <div id="logo">
      <img src="resources/tracking.png" alt="logo">
      <p>GPSTrackingVozila.ba</p>
    </div>
    

    <div class="formholder" style="margin-top: 5%">
	    <div class="randompad">
	    	<form:form action="unosVozila" method="post" commandName="userFormUnosVozila">
		    	<fieldset>
			    	<label name="markaVozila">Marka vozila</label>
		    		<form:input path="markaVozila" />
		    		<label name="model">Model</label>
		    		<form:input path="model"/>
		    		<label name="serviskm">Servis (km)</label>
		    		<form:input path="serviskm"/>
		    		<label name="servismj">Servis (mjeseci))</label>
		    		<form:input path="servismj"/>
		    		<label name="godiste">Godiste</label>
		    		<form:input path="godiste"/>
		    		<label name="registarskaOznaka">Registarska oznaka</label>
		    		<form:input path="registarskaOznaka"/>
		    		<input type="submit" value="Unesi vozilo">
		    	</fieldset>
	    	</form:form>
	    </div>
    </div>
    

      
    </div>
  </div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

     <script src="resources/js/index.js"></script>

</body>
</html>