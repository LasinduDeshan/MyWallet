package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Services.customerService;
import model.customer;

@WebServlet("/deleteCustomer")
public class deleteCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public deleteCustomer() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        
        if (email != null && !email.isEmpty()) {
            customerService service = new customerService();
            customer cus = new customer();
            cus.setEmail(email);
            
            boolean isDeleted = service.deleteCustomer(cus);
            
            if (isDeleted) {
                // Redirect to the customer list page after successful deletion
                response.sendRedirect("adminCustomer");
            } else {
                // Handle the case when deletion fails
                request.setAttribute("error", "Failed to delete customer.");
                request.getRequestDispatcher("AdminTable.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("adminCustomer");
        }
    }
}
