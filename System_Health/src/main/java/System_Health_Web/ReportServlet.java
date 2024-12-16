package System_Health_Web;

import java.io.IOException;


import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import System_Health_DAO.ReportDAO;
import System_Health_Model.Report;

@WebServlet("/")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReportDAO reportDAO;

    public void init() {
        reportDAO = new ReportDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertReport(request, response);
                    break;
                case "/delete":
                case "/deleteOperation":
                    deleteReport(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateReport(request, response);
                    break;
                case "/listOperations":
                    listOperations(request, response);
                    break;
                default:
                    listOperations(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    // List all CRUD operation records
    private void listOperations(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Report> listReports = reportDAO.selectAllCRUDRecords();
        request.setAttribute("listCRUDRecords", listReports);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/crud-record-list.jsp");
        dispatcher.forward(request, response);
    }

    // Show form to create a new CRUDRecord
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/crud-record-form.jsp");
        dispatcher.forward(request, response);
    }

    // Show form to edit an existing CRUDRecord
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String recordId = request.getParameter("id");
        Report existingReport = reportDAO.selectCRUDRecord(recordId);
        if (existingReport == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Record not found");
            return;
        }
        request.setAttribute("report", existingReport);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/crud-record-form.jsp");
        dispatcher.forward(request, response);
    }

    // Insert a new CRUDRecord
    private void insertReport(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        String entityType = request.getParameter("entity_type");
        String operationType = request.getParameter("operation_type");
        String initiatedBy = request.getParameter("initiated_by");
        String operationDetails = request.getParameter("operation_details");

        String recordId = UUID.randomUUID().toString(); // Generate a unique UUID for record_id
        String ipAddress = request.getParameter("ip_address"); // Retrieve client's IP address
        LocalDateTime operationTimestamp = LocalDateTime.now(); // Current timestamp

        Report newReport = new Report(
            recordId,
            entityType,
            operationType,
            initiatedBy,
            java.sql.Timestamp.valueOf(operationTimestamp),
            ipAddress,
            operationDetails
        );

        // Insert report
        reportDAO.insertCRUDRecord(newReport);

        response.sendRedirect(request.getContextPath() + "/listOperations");
    }

 // Update an existing CRUDRecord
    private void updateReport(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        String recordId = request.getParameter("record_id");
        String entityType = request.getParameter("entity_type");
        String operationType = request.getParameter("operation_type");
        String initiatedBy = request.getParameter("initiated_by");
        String operationTimestampStr = request.getParameter("operation_timestamp");
        String ipAddress = request.getParameter("ip_address");
        String operationDetails = request.getParameter("operation_details");

        java.sql.Timestamp operationTimestamp = null;
        try {
            // Attempt to parse the timestamp
            operationTimestamp = java.sql.Timestamp.valueOf(operationTimestampStr);
        } catch (IllegalArgumentException e) {
            // Handle parsing error
  
            operationTimestamp = new java.sql.Timestamp(System.currentTimeMillis());
            
        }
        

        Report updatedReport = new Report(
            recordId,
            entityType,
            operationType,
            initiatedBy,
            operationTimestamp,
            ipAddress,
            operationDetails
        );

        reportDAO.updateCRUDRecord(updatedReport);
        response.sendRedirect(request.getContextPath() + "/listOperations");
    }


    // Delete a CRUDRecord
    private void deleteReport(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        String recordId = request.getParameter("id");
        reportDAO.deleteCRUDRecord(recordId);
        response.sendRedirect(request.getContextPath() + "/listOperations");
    }
}
