package net.codejava.springmvc;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

public class VoziloDAO {
	
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public void unesi(Vozilo v) {
		
		Connection c = null;
	    Statement stmt = null;
	    
	    try 
	    {
	    	c = dataSource.getConnection();
	    	c.setAutoCommit(false);
	    	System.out.println("Opened database successfully");

	        stmt = c.createStatement();
	    	System.out.println("Opened database successfully");
	    	String sql = "INSERT INTO VOZNI_PARK.VOZILO (REGISTRACIJA,NAZIV,STATUS,ZADNJI_SERVIS_KILOMETRI,ZADNJI_SERVIS_MJESECI,PREDJENI_KILOMETRI,PROIZVODJAC,GODINA_PROIZVODNJE) "
		               + "VALUES ('";
	    	String parametri = v.getRegistarskaOznaka() + "','" + v.getModel() + "','" + "Slobodan" + "','" + v.getServiskm() + "','" + v.getServismj() + "','" + "500" + "','" + v.getMarkaVozila() + "','" + v.getGodiste() + "' );";
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
}