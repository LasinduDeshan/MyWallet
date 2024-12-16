package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.stdLoan;

public class DBConnect {
	
	public static Connection getConnection() {
		
		//My Database details
		String url = "jdbc:mysql://localhost:3306/Online_Banking_System?characterEncoding=utf8";
		String username = "root";
		String password = "Lasindu123#";
		Connection con = null;
		
		try {
			// Load MySQL JDBC Driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// Establish connection
			con = DriverManager.getConnection(url, username, password);
			
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC Driver not found.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Database connection failed.");
			e.printStackTrace();
		}
		
		return con; 
	}
	
	

	
	
}
