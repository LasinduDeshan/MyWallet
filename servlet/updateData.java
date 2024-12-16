package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.stdLoan;
import service.Loanservice;

@WebServlet("/updateData")
public class updateData extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Loanservice loanService = new Loanservice();

        // Retrieve parameters from the request
        String stdLoanAppID = request.getParameter("stdLoanAppID");
        String accountNumber = request.getParameter("accountNumber");
        String nicNumber = request.getParameter("nicNumber");
        String loanNickname = request.getParameter("loanNickname");
        double tuitionFee =Double.parseDouble(request.getParameter("tuitionFee")) ;
        int courseDuration = Integer.parseInt(request.getParameter("courseDuration"));
        String institutionName = request.getParameter("institutionName");
        String studyProgram = request.getParameter("studyProgram");
        double monthlyLivingExpenses = Double.parseDouble(request.getParameter("monthlyLivingExpenses"));
        String partTimeJob = request.getParameter("partTimeJob");
        int loanDuration = Integer.parseInt(request.getParameter("loanDuration"));
        
        


        System.out.println(stdLoanAppID);
        boolean isTrue;
		isTrue = Loanservice.updatedata( stdLoanAppID, accountNumber, nicNumber, loanNickname, tuitionFee, courseDuration,  institutionName, studyProgram, monthlyLivingExpenses, partTimeJob,  loanDuration );
       
		if(isTrue==true ) {
			
			// Retrieve updated loan details by ID
			List<stdLoan> Loandet = Loanservice.getById(stdLoanAppID);
			request.setAttribute("Loandet",Loandet);
			
			String alertMessage = "Data Update Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='loanIndex.jsp';</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("updataLoan_det.jsp");
			dis2.forward(request, response);
			
		}
		
		
		
        
    }
}
