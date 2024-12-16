package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Services.customerService;
import model.customer;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public login() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		customer cus = new customer();
		cus.setEmail(request.getParameter("email"));
		cus.setPassword(request.getParameter("password"));
		
		customerService service = new customerService();
		boolean status = service.validate(cus);
		
		if(status) {
			
			customer loginedCus = service.getOne(cus);
			RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
			request.setAttribute("customer",loginedCus);
			dispatcher.forward(request, response);
			
			
			
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			
		}
		
		
	}

}