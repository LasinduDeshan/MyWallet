package Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Controller.DBconnect;
import model.customer;

public class customerService {
	
	public void regCustomer(customer cus) {
		try {
			String query = "insert into Customer values ('"+cus.getFirstname()+"','"+cus.getLastname()+"','"+cus.getNIC()+"','"+cus.getAccounttype()+"','"+cus.getAccountNo()+"','"+cus.getDateofbirth()+"','"+cus.getAddress()+"','"+cus.getPhoneno()+"','"+cus.getEmail()+"','"+cus.getPassword()+"')";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}




public boolean validate(customer cus) {
	try {

    String query = "select * from Customer where email = '"+cus.getEmail()+"'and password='"+cus.getPassword()+"'";
    
    Statement statement = DBconnect.getConnection().createStatement();
    
    ResultSet rs = statement.executeQuery(query);
    if(rs.next()) {
    	return true;
    }
}catch(Exception e){
	e.printStackTrace(); 
	
}
	
	return false;
}

public customer getOne(customer cus) {
	try {

    String query = "select * from Customer where email = '"+cus.getEmail()+"','"+cus.getPassword()+"'";
    
    Statement statement = DBconnect.getConnection().createStatement();
    
    ResultSet rs = statement.executeQuery(query);
    if(rs.next()) {
    	cus.setFirstname(rs.getString("firstname"));
    	cus.setLastname(rs.getString("lastname"));
    	cus.setNIC(rs.getString("NIC"));
    	cus.setAccounttype(rs.getString("accounttype"));
    	cus.setAccountNo(rs.getString("accountno"));
    	cus.setDateofbirth(rs.getString("dateofbirth"));
    	cus.setAddress(rs.getString("address"));
    	cus.setPhoneno(rs.getString("phoneno"));
    	cus.setEmail(rs.getString("email"));
    	cus.setPassword(rs.getString("password"));
    	
    	return cus;
    }
}catch(Exception e){
	e.printStackTrace(); 
	
}
	
	return null;
}




public ArrayList<customer> getAllCustomer(){
	try {
		ArrayList<customer> listCus = new ArrayList<customer>();
		
		String query = "select * from Customer";
		
		Statement statement = DBconnect.getConnection().createStatement();
		ResultSet rs = statement.executeQuery(query);
		while(rs.next()) {
			customer cus= new customer();
			cus.setFirstname(rs.getString("firstname"));
			cus.setLastname(rs.getString("lastname"));
			cus.setNIC(rs.getString("NIC"));
			cus.setAccounttype(rs.getString("accounttype"));
			cus.setAccountNo(rs.getString("accountno"));
			cus.setDateofbirth(rs.getString("dateofbirth"));
			cus.setAddress(rs.getString("address"));
			cus.setPhoneno(rs.getString("phoneno"));
			cus.setEmail(rs.getString("email"));
			cus.setPassword(rs.getString("password"));
			listCus.add(cus);
	} return listCus;
		
	}catch(Exception e) {
		e.printStackTrace();
		return null;
	}
}
	
	
public customer singleDataButton(customer cus) {
    try {
        String query = "SELECT * FROM Customer WHERE email = ?";
        PreparedStatement statement = DBconnect.getConnection().prepareStatement(query);
        statement.setString(1, cus.getEmail());
        
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            cus.setFirstname(rs.getString("firstname"));
            cus.setLastname(rs.getString("lastname"));
            cus.setNIC(rs.getString("NIC"));
            cus.setAccounttype(rs.getString("accounttype"));
            cus.setAccountNo(rs.getString("accountno"));
            cus.setDateofbirth(rs.getString("dateofbirth"));
            cus.setAddress(rs.getString("address"));
            cus.setPhoneno(rs.getString("phoneno"));
            cus.setEmail(rs.getString("email"));
            cus.setPassword(rs.getString("password"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return cus;
}




public void updateCustomer(customer customer) {
    String query = "UPDATE Customer SET firstname=?, lastname=?, NIC=?, accounttype=?, accountNo=?, dateofbirth=?, address=?, phoneno=?, password=? WHERE email=?";
    
    try (Connection connection = DBconnect.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
         
        preparedStatement.setString(1, customer.getFirstname());
        preparedStatement.setString(2, customer.getLastname());
        preparedStatement.setString(3, customer.getNIC());
        preparedStatement.setString(4, customer.getAccounttype());
        preparedStatement.setString(5, customer.getAccountNo());
        preparedStatement.setString(6, customer.getDateofbirth());
        preparedStatement.setString(7, customer.getAddress());
        preparedStatement.setString(8, customer.getPhoneno());
        preparedStatement.setString(9, customer.getPassword());
        preparedStatement.setString(10, customer.getEmail());

        preparedStatement.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace(); // Better to log this
    }
}


public boolean deleteCustomer(customer cus) {
    try {
        String query = "DELETE FROM Customer WHERE email='" + cus.getEmail() + "'";
        
        Statement statement = DBconnect.getConnection().createStatement();
        int rowsAffected = statement.executeUpdate(query);
        
        return rowsAffected > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

	
	
	
}

