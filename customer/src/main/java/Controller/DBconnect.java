package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBconnect {
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
        String username = "root";
        String password = "Tanuri@123";
        

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Account_Management?characterEncoding=utf8",username,password);

        
        return con;
    }

}
