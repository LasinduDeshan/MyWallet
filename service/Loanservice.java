package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Controller.DBConnect;
import model.stdLoan;

public class Loanservice {
	
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

    // Method to register a new student loan
	public boolean regStdLoan(stdLoan loan) {
	    String query = "INSERT INTO StudentLoanApp2 (accountNumber, nicNumber, loanNickname, tuitionFee, courseDuration, institutionName, studyProgram, monthlyLivingExpenses, partTimeJob, loanDuration) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    
	    try (Connection connection = DBConnect.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(query)) {

	        // Setting the correct data types in the prepared statement
	        preparedStatement.setString(1, loan.getAccountNumber());
	        preparedStatement.setString(2, loan.getNicNumber());
	        preparedStatement.setString(3, loan.getLoanNickname());
	        preparedStatement.setDouble(4, loan.getTuitionFee());  
	        preparedStatement.setInt(5, loan.getCourseDuration());  
	        preparedStatement.setString(6, loan.getInstitutionName());
	        preparedStatement.setString(7, loan.getStudyProgram());
	        preparedStatement.setDouble(8, loan.getMonthlyLivingExpenses());  
	        preparedStatement.setString(9, loan.getPartTimeJob());
	        preparedStatement.setInt(10, loan.getLoanDuration());  

	        // Execute the query
	        preparedStatement.executeUpdate();
	        return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	
	public static List<stdLoan>getById(String ID){
			
			int convertedID = Integer.parseInt(ID);
			
			ArrayList<stdLoan> stock = new ArrayList<>();
			
			try {
				
				con=DBConnect.getConnection();
				stmt=con.createStatement();
				
				//check that
				String sql ="select * from StudentLoanApp2  where stdLoanAppID= '"+convertedID+"'";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					
					
					int stdLoanAppID = rs.getInt(1);
	            	String accountNumber = rs.getString(2);
	            	String nicNumber = rs.getString(3);
	            	String loanNickname  = rs.getString(4);
	            	double tuitionFee  = rs.getDouble(5);
	            	int courseDuration = rs.getInt(6);
	            	String institutionName = rs.getString(7);
	            	String studyProgram = rs.getString(8);
	            	double monthlyLivingExpenses = rs.getDouble(9);
	            	String partTimeJob = rs.getString(10);
	            	int loanDuration = rs.getInt(11);
					
	            	stdLoan sloan = new stdLoan(stdLoanAppID, accountNumber,nicNumber,loanNickname,tuitionFee,courseDuration,institutionName,studyProgram ,monthlyLivingExpenses, partTimeJob, loanDuration);
					stock.add(sloan);
					
				}
				
			}catch(Exception e) {
				
				e.printStackTrace();
			}
			return stock;
			
			
		}


    // Method to retrieve all student loans
	  public ArrayList<stdLoan> getAllLoans() {
	        ArrayList<stdLoan> listLoan = new ArrayList<>();
	        String query = "SELECT * FROM StudentLoanApp2";

	        try (Connection connection = DBConnect.getConnection();
	             Statement statement = connection.createStatement();
	             ResultSet rs = statement.executeQuery(query)) {

	            while (rs.next()) {
	                stdLoan loan = new stdLoan();
	                loan.setStdLoanAppID(rs.getInt("stdLoanAppID"));  // Changed to set Integer
	                loan.setAccountNumber(rs.getString("accountNumber"));
	                loan.setNicNumber(rs.getString("nicNumber"));
	                loan.setLoanNickname(rs.getString("loanNickname"));
	                loan.setTuitionFee(rs.getDouble("tuitionFee"));
	                loan.setCourseDuration(rs.getInt("courseDuration"));
	                loan.setInstitutionName(rs.getString("institutionName"));
	                loan.setStudyProgram(rs.getString("studyProgram"));
	                loan.setMonthlyLivingExpenses(rs.getDouble("monthlyLivingExpenses"));
	                loan.setPartTimeJob(rs.getString("partTimeJob"));
	                loan.setLoanDuration(rs.getInt("loanDuration"));

	                listLoan.add(loan);
	                
	                
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return listLoan;
	    }
	    
    
    
    // Method to update a student loan
    public static boolean updatedata(String stdLoanAppID,String accountNumber,String nicNumber,String loanNickname,double tuitionFee,int courseDuration, String institutionName,String studyProgram,double monthlyLivingExpenses, String partTimeJob, int loanDuration ) {
		
    	
		try {
			
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			
			String sql = "update StudentLoanApp2 set  accountNumber='"+accountNumber+"', nicNumber='"+nicNumber+"', loanNickname='"+loanNickname+"', tuitionFee='"+tuitionFee+"', courseDuration='"+courseDuration+"', institutionName='"+institutionName+"', studyProgram='"+studyProgram+"', monthlyLivingExpenses='"+monthlyLivingExpenses+"' ,partTimeJob='"+partTimeJob+"' ,loanDuration='"+loanDuration+"' where stdLoanAppID='"+stdLoanAppID+"'";


			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return isSuccess;
		
	}
    

    // Delete loan method
    public boolean deleteLoanById(int id) {
        String query = "DELETE FROM StudentLoanApp2 WHERE stdLoanAppID = ?";
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, id);
            int affectedRows = preparedStatement.executeUpdate();
            
            return affectedRows > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}

