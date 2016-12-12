package net.codejava.springmvc;

public class GpsKoordinate {
	
	private int id;
	private double duzina;
	private double sirina;
	private String voziloid;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public double getDuzina() {
		return this.duzina;
	}
	
	public void setDuzina(double duzina) {
		this.duzina = duzina;
	}
	
	public double getSirina() {
		return this.sirina;
	}
	
	public void setSirina(double sirina) {
		this.sirina = sirina;
	}
	
	public String getVoziloid() {
		return this.voziloid;
	}
	
	public void setVoziloid(String registracija) {
		this.voziloid = registracija;
	}
	
	GpsKoordinate() {}
}