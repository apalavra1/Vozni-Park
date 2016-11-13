package net.codejava.springmvc;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class Vozilo {
	private String markaVozila;
	private String model;
	private double serviskm;
	private int servismj;
	private Date godiste;
	private String registraskaOznaka;
	
	public String getMarkaVozila() {
		return this.markaVozila;
	}
	
	public void setMarkaVozila(String markaVozila) {
		this.markaVozila = markaVozila;
	}
	
	public String getModel() {
		return this.model;
	}
	
	public void setModel(String model) {
		this.model = model;
	}
	
	public double getServiskm() {
		return this.serviskm;
	}
	
	public void setServiskm(double serviskm) {
		this.serviskm = serviskm;
	}
	
	public int getServismj() {
		return this.servismj;
	}
	
	public void setServismj(int servismj) {
		this.serviskm = servismj;
	}
	
	public Date getGodiste() {
		return this.godiste;
	}
	
	public void setGodiste(Date godiste) {
		this.godiste = godiste;
	}
	
	public String getRegistarskaOznaka() {
		return this.registraskaOznaka;
	}
	
	public void setRegistarskaOznaka(String registarskaOznaka) {
		this.registraskaOznaka = registarskaOznaka;
	}
	
	Vozilo() { }
}