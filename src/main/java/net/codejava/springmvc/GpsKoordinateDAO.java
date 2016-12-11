package net.codejava.springmvc;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

public class GpsKoordinateDAO {
	
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public GpsKoordinate dajKoordinate(String reg) {
		
		GpsKoordinate gps = new GpsKoordinate();
		Connection c = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    
	    try 
	    {
	    	c = dataSource.getConnection();
	    	c.setAutoCommit(false);
	    	System.out.println("Opened database successfully");
	    	
	    	String sql = "SELECT DUZINA, SIRINA, ID, VOZILO_ID FROM VOZNI_PARK.GPS_KOORDINATE WHERE VOZILO_ID=";
	    	sql = sql + "'" + reg + "';";

	        stmt = c.createStatement();
	        rs = stmt.executeQuery(sql);
	    	if(rs.next())
	    	{
	    		gps.setDuzina(rs.getDouble("DUZINA"));
	    		gps.setSirina(rs.getDouble("SIRINA"));
	    		gps.setId(rs.getInt("ID"));
	    		gps.setVoziloId(rs.getString("VOZILO_ID"));
	    	}
	    	else
	    	{
	    		System.out.println("Netacni podaci");
	    	}
	    	rs.close();
	        stmt.close();
	        c.commit();
	        c.close();
	    }
	    catch (Exception e) 
	    {
	    	System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	    	System.exit(0);
	    }
	    return gps;
	}
}