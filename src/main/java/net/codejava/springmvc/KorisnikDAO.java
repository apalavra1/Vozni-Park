package net.codejava.springmvc;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

public class KorisnikDAO 
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
		
	public void unesi(Korisnik k)
	{
		Connection c = null;
	    Statement stmt = null;
	    
	    try 
	    {
	    	c = dataSource.getConnection();
	    	c.setAutoCommit(false);
	    	System.out.println("Opened database successfully");

	        stmt = c.createStatement();
	    	System.out.println("Opened database successfully");
	    	String sql = "INSERT INTO VOZNI_PARK.KORISNIK (ID,IME,PREZIME,EMAIL_ADRESA,DATUM_RODJENJA,USERNAME,PASSWORD,POTVRDA_PASSWORD) "
		               + "VALUES (";
	    	String parametri = Integer.toString(k.getId()) + ", '" + k.getIme() + "','" + k.getPrezime() + "','" + k.getEmail_adresa() + "',null,'" + k.getUsername() + "','" + k.getPassword() + "','" + k.getPotvrda_password() + "' );";
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
	
	public void provjeriLogin(String username, String password)
	{
		Connection c = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    
	    try 
	    {
	    	c = dataSource.getConnection();
	    	c.setAutoCommit(false);
	    	System.out.println("Opened database successfully");
	    	
	    	String sql = "SELECT * FROM VOZNI_PARK.KORISNIK WHERE USERNAME=";
	    	sql = sql + "'" + username + "'" + " AND PASSWORD=" + "'" + password + "';";

	        stmt = c.createStatement();
	        rs = stmt.executeQuery(sql);
	    	if(rs.next())
	    	{
	    		System.out.println("Uspjesan login");
	    	}
	    	else System.out.println("Netacni podaci");
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
	    System.out.println("Operation done successfully");
	}
	
	

}
