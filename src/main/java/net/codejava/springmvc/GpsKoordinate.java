package net.codejava.springmvc;

public class GpsKoordinate {
	
	private int id;
	private double duzina;
	private double sirina;
	private String voziloId;
	
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
	
	public String getVoziloId() {
		return this.voziloId;
	}
	
	public void setVoziloId(String registracija) {
		this.voziloId = registracija;
	}
	
	GpsKoordinate() {}
}