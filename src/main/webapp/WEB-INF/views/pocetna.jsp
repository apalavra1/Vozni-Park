<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
  <meta charset="UTF-8">
  <title>GPS tracking vozila</title>
  <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
</head>
<body>
  <div id="wrap">
    <div id="regbar">
      <div id="navthing">
        <h2><a id="loginform">Prijava</a> | <a href="#" id="registerform">Registracija</a></h2>
      <div class="login">
        <div class="arrow-up"></div>
        <div class="formholder">
          <div class="randompad">
			<form:form action="login" method="post" commandName="userFormLogin">
				<fieldset>
				   <form:hidden path="id" />
	               <label name="userName">Korisničko ime</label>
	               <form:input path="username" />
	               <label name="password">Korisnička šifra</label>
	               <form:password path="password" />
	               <input type="submit" value="Prijavi se" />
	             </fieldset>
			</form:form>          
          </div>
        </div>
      </div>
      <div class="register">
        <div class="arrow-up"></div>
        <div class="formholder">
          <div class="randompad">
	          <form:form action="register" method="post" commandName="userFormRegister">
	             <fieldset id="lijevo">
	             	   <form:hidden path="id" />
		               <label name="ime">Ime</label>
		               <form:input path="ime" />
		               <label name="prezime">Prezime</label>
		               <form:input path="prezime" />
		               <label name="datumRodjenja">Datum rođenja</label>
		               <form:input path="datum_rodjenja" />
		               <label name="emailAdresa">Email adresa</label>
		               <form:input path="email_adresa" placeholder="example@example.com" />
	             </fieldset>
	             <fieldset id="desno">
		               <label name="korisnickoime">Korisničko ime</label>
		               <form:input path="username" />
		               <label name="korisnickasifra">Korisnička šifra</label>
		               <form:password path="password" />
		               <label name="ponovounesisifru">Ponovo unesite šifru</label>
		               <form:password path="potvrda_password" />
	             </fieldset>
	             <input type="submit" value="Registrirajte se" />
	          </form:form>
          </div>
        </div>
      </div>
      </div>
    </div>
    
    <div id="logo">
      <img src="resources/tracking.png" alt="logo">
      <p>GPSTrackingVozila.ba</p>
    </div>
    
    <div id="banneri">
      <div id="bannerLeft">
        <p>Lagan i efikasan način praćenja svih vaših vozila i putem smartphone-a</p>
        <img src="resources/google maps.jpg" alt="smarthpone">
      </div>

      <div id="bannerBottom">
        <p>Da li imate potrebu da u svakom trenutku imate uvid u lokaciju svih vozila u vašem voznom parku? Ukoliko je odgovor na ovo pitanje potrdan, imamo rješenje za vas. Registrujte sa 
        na našu web stranicu i uvijek budite u mogućnosti da brzo i lako provjerite lokacije vaših vozila.</p>
      </div>
    </div>
  </div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

     <script src="resources/js/index.js"></script>

</body>
</html>