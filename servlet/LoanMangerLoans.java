package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.stdLoan;
import service.Loanservice;

/**
 * Servlet implementation class LoanMangerLoans
 */
@WebServlet("/LoanMangerLoans")
public class LoanMangerLoans extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Loanservice service = new Loanservice();
		
		// Retrieve all loans and store them in an ArrayList
		ArrayList<stdLoan> sLoan = service.getAllLoans();
		request.setAttribute("stdLoan", sLoan);
		
		// Get the RequestDispatcher to forward the request to LoanTable.jsp
		RequestDispatcher dispacher = request.getRequestDispatcher("LoanTable.jsp");
		
		dispacher.forward(request, response);
	}

}
