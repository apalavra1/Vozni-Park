package net.codejava.springmvc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

public class VoziloDAO {
	
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public void unesi(Vozilo v, int id) {
		
		Connection c = null;
	    Statement stmt = null;
	    
	    try 
	    {
	    	c = dataSource.getConnection();
	    	c.setAutoCommit(false);
	    	System.out.println("Opened database successfully");

	        stmt = c.createStatement();
	    	System.out.println("Opened database successfully");
	    	String sql = "INSERT INTO VOZNI_PARK.VOZILO (REGISTRACIJA,NAZIV,STATUS,ZADNJI_SERVIS_KILOMETRI,ZADNJI_SERVIS_MJESECI,PREDJENI_KILOMETRI,PROIZVODJAC,GODINA_PROIZVODNJE,KORISNIK_ID) "
		               + "VALUES ('";
	    	String parametri = v.getRegistarskaOznaka() + "','" + v.getModel() + "','" + "Slobodan" + "','" + v.getServiskm() + "','" + v.getServismj() + "','" + "500" + "','" + v.getMarkaVozila() + "','" + v.getGodiste() + "','" + id + "' );";
	    	sql += parametri;
	    	
	    	stmt.executeUpdate(sql);

	        stmt.close();
	        c.commit();
	        c.close();
	    }
	    catch (Exception e) 
	    {
	    	System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	    	System.exit(0);
	    }
	    System.out.println("Records created successfully");
	}
	
	public List<Vozilo> dajVozila(int id) {
		
		List<Vozilo> lista_vozila = new ArrayList<Vozilo>();
		Connection c = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    
	    try {
	    	c = dataSource.getConnection();
	    	c.setAutoCommit(false);
	    	System.out.println("Opened database successfully");
	    	
	    	String sql = "SELECT REGISTRACIJA, NAZIV, STATUS, ZADNJI_SERVIS_KILOMETRI, ZADNJI_SERVIS_MJESECI, PREDJENI_KILOMETRI, PROIZVODJAC, GODINA_PROIZVODNJE, ID FROM VOZNI_PARK.VOZILO WHERE KORISNIK_ID=";
	    	sql = sql + "'" + id + "'";
	    	
	    	stmt = c.createStatement();
	        rs = stmt.executeQuery(sql);
	        
	        while(rs.next()) {
	        	Vozilo v = new Vozilo();
	        	v.setRegistarskaOznaka(rs.getString("REGISTRACIJA"));
	        	v.setModel(rs.getString("NAZIV"));
	        	v.setServiskm(rs.getDouble("ZADNJI_SERVIS_KILOMETRI"));
	        	System.out.println(v.getServiskm());
	        	v.setServismj(rs.getInt("ZADNJI_SERVIS_MJESECI"));
	        	v.setMarkaVozila(rs.getString("PROIZVODJAC"));
	        	v.setGodiste(rs.getDate("GODINA_PROIZVODNJE"));
	        	
	        	lista_vozila.add(v);
	        }
	        
	        rs.close();
	        stmt.close();
	        c.commit();
	        c.close();
	    }catch (Exception e) 
	    {
	    	System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	    	System.exit(0);
	    }
	    return lista_vozila;
	}
}