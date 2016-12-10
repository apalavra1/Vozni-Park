<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit vozila</title>
  <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
</head>
<body>
  <div id="wrap">
    <div id="regbar">
      <div id="navthing">      
    
    <div id="logo">
      <img src="resources/tracking.png" alt="logo">
      <p>GPSTrackingVozila.ba</p>
    </div>
    

    <div class="formholder" style="margin-top: 5%">
	    <div class="randompad">
	    	<form:form action="editVozila" method="post" commandName="userFormEditVozila">
		    	<fieldset>
			    	<label name="markaVozila">Marka vozila</label>
		    		<form:input path="markaVozila" />
		    		<label name="model">Model</label>
		    		<form:input path="model"/>
		    		<label name="serviskm">Servisni interval (km)</label>
		    		<form:input path="serviskm"/>
		    		<label name="servismj">Servis interval (mjeseci))</label>
		    		<form:input path="servismj"/>
		    		<label name="godiste">Godiste</label>
		    		<form:input path="godiste"/>
		    		<label name="registarskaOznaka">Registarska oznaka</label>
		    		<form:input path="registarskaOznaka"/>
		    		<form:hidden path="id"/>
		    		<input type="submit" value="Spasi promjene">
		    	</fieldset>
	    	</form:form>
	    </div>
    </div>
    

      
    </div>
  </div>
  </div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

     <script src="resources/js/index.js"></script>

</body>
</html>