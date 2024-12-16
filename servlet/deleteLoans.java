package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

import service.Loanservice;
import model.stdLoan;

@WebServlet("/deleteLoans")
public class deleteLoans extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	
        	// Retrieve the stdLoanAppID from the request parameter and parse it to an integer
            int stdLoanAppID = Integer.parseInt(request.getParameter("stdLoanAppID"));
            Loanservice service = new Loanservice();
            
            // Attempt to delete the loan by its ID
            boolean isDeleted = service.deleteLoanById(stdLoanAppID);

            
            if (isDeleted) {
                
                List<stdLoan> loanList = service.getAllLoans();
                request.setAttribute("stdLoan", loanList);
                request.getRequestDispatcher("LoanTable.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}

