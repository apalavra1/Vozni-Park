package net.codejava.springmvc;

import java.sql.Date;

public class Korisnik 
{
		private int id;
		private String ime;
		private String prezime;
		private String email_adresa;
		
		public int getId() {
			return id;
		}
		
		public void setId(int id) {
			this.id = id;
		}
		
		public String getIme() {
			return ime;
		}
		
		public void setIme(String ime) {
			this.ime = ime;
		}
		
		public String getPrezime() {
			return prezime;
		}
		
		public void setPrezime(String prezime) {
			this.prezime = prezime;
		}
		
		public String getEmail_adresa() {
			return email_adresa;
		}
		
		public void setEmail_adresa(String email_adresa) {
			this.email_adresa = email_adresa;
		}
		
		public Date getDatum_rodjenja() {
			return datum_rodjenja;
		}
		
		public void setDatum_rodjenja(Date datum_rodjenja) {
			this.datum_rodjenja = datum_rodjenja;
		}
		
		public String getUsername() {
			return username;
		}
		
		public void setUsername(String username) {
			this.username = username;
		}
		
		public String getPassword() {
			return password;
		}
		
		public void setPassword(String password) {
			this.password = password;
		}
		
		private Date datum_rodjenja;
		private String username;
		private String password;
		private String potvrda_password;
		
		public String getPotvrda_password() {
			return potvrda_password;
		}

		public void setPotvrda_password(String potvrda_password) {
			this.potvrda_password = potvrda_password;
		}

		Korisnik() { }
		

}
