package Support_Web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Support_DAO.SupportDAO;
import Support_Model.Support;

@WebServlet("/")
public class SupportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SupportDAO supportDAO;

    @Override
    public void init() {
        supportDAO = new SupportDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertSupport(request, response);
                    break;
                case "/delete":
                    deleteSupport(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateSupport(request, response);
                    break;
                default:
                    listSupport(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listSupport(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Support> listSupport = supportDAO.selectAllSupports();
        request.setAttribute("listSupport", listSupport);
        RequestDispatcher dispatcher = request.getRequestDispatcher("support-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("support-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Support existingSupport = supportDAO.selectSupport(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("support-form.jsp");
        request.setAttribute("support", existingSupport);
        dispatcher.forward(request, response);
    }

    private void insertSupport(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String customerName = request.getParameter("customerName");
        String nicNumber = request.getParameter("nicNumber");
        String questionType = request.getParameter("questionType");
        String questionDescription = request.getParameter("questionDescription");

        Support newSupport = new Support(customerName, nicNumber, questionType, questionDescription);
        supportDAO.insertSupport(newSupport);
        response.sendRedirect("list");
    }

    private void updateSupport(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String customerName = request.getParameter("customerName");
        String nicNumber = request.getParameter("nicNumber");
        String questionType = request.getParameter("questionType");
        String questionDescription = request.getParameter("questionDescription");

        Support updatedSupport = new Support(id, customerName, nicNumber, questionType, questionDescription);
        supportDAO.updateSupport(updatedSupport);
        response.sendRedirect("list");
    }

    private void deleteSupport(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        supportDAO.deleteSupport(id);
        response.sendRedirect("list");
    }
}
