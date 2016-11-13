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
	
	public Korisnik dajKorisnika(String username, String password)
	{
		Korisnik k = new Korisnik();
		Connection c = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    try 
	    {
	    	c = dataSource.getConnection();
	    	c.setAutoCommit(false);
	    	System.out.println("Opened database successfully");
	    	
	    	String sql = "SELECT ID,IME,PREZIME,EMAIL_ADRESA,DATUM_RODJENJA,POTVRDA_PASSWORD FROM VOZNI_PARK.KORISNIK WHERE USERNAME=";
	    	sql = sql + "'" + username + "'" + " AND PASSWORD=" + "'" + password + "';";

	        stmt = c.createStatement();
	        rs = stmt.executeQuery(sql);
	    	if(rs.next())
	    	{
	    		k.setId(rs.getInt("ID"));
	    		k.setIme(rs.getString("IME"));
	    		k.setPrezime(rs.getString("PREZIME"));
	    		k.setEmail_adresa(rs.getString("EMAIL_ADRESA"));
	    		k.setDatum_rodjenja(rs.getDate("DATUM_RODJENJA"));
	    		k.setPotvrda_password(rs.getString("POTVRDA_PASSWORD"));
	    		k.setUsername(username);
	    		k.setPassword(password);
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
	    return k;
	}
	
	public int dajId(String username, String password)
	{
		int id = 0;
		Connection c = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    try 
	    {
	    	c = dataSource.getConnection();
	    	c.setAutoCommit(false);
	    	System.out.println("Opened database successfully");
	    	
	    	String sql = "SELECT ID FROM VOZNI_PARK.KORISNIK WHERE USERNAME=";
	    	sql = sql + "'" + username + "'" + " AND PASSWORD=" + "'" + password + "';";

	        stmt = c.createStatement();
	        rs = stmt.executeQuery(sql);
	    	if(rs.next())
	    	{
	    		id = rs.getInt("ID");
	    		System.out.println(id);
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
	    
	    return id;
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
	    	String sql = "INSERT INTO VOZNI_PARK.KORISNIK (IME,PREZIME,EMAIL_ADRESA,DATUM_RODJENJA,USERNAME,PASSWORD,POTVRDA_PASSWORD) "
		               + "VALUES ('";
	    	String parametri = k.getIme() + "','" + k.getPrezime() + "','" + k.getEmail_adresa() + "','" + k.getDatum_rodjenja() + "','" + k.getUsername() + "','" + k.getPassword() + "','" + k.getPotvrda_password() + "' );";
	    	sql += parametri;
	    	
	    	stmt.executeUpdate(sql);

	        stmt.close();
	        c.commit();
	        c.close();
	        k.setId(dajId(k.getUsername(), k.getPassword()));
	    }
	    catch (Exception e) 
	    {
	    	System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	    	System.exit(0);
	    }
	    System.out.println("Records created successfully");
		
	}
	
	public Boolean provjeriLogin(String username, String password)
	{
		Connection c = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    Boolean rezultat = false;
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
	    		rezultat = true;
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
	    
	    System.out.println("Operation done successfully");
	    return rezultat;
	}
	
	

}
