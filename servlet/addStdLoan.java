package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.stdLoan;
import service.Loanservice;

@WebServlet("/addStdLoan")
public class addStdLoan extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        stdLoan sloan = new stdLoan();

        // Set the loan application fields from the request parameters
        sloan.setAccountNumber(request.getParameter("accountNumber"));
        sloan.setNicNumber(request.getParameter("nicNumber"));
        sloan.setLoanNickname(request.getParameter("loanNickname"));

        // Parsing numeric values as double and int
        try {
            sloan.setTuitionFee(Double.parseDouble(request.getParameter("tuitionFee"))); 
            sloan.setCourseDuration(Integer.parseInt(request.getParameter("courseDuration"))); 
            sloan.setMonthlyLivingExpenses(Double.parseDouble(request.getParameter("monthlyLivingExpenses"))); 
            sloan.setLoanDuration(Integer.parseInt(request.getParameter("loanDuration"))); 
        } catch (NumberFormatException e) {
            displayAlert(response, "Error", "Please enter valid numeric values!", "error");
            return;
        }

        sloan.setInstitutionName(request.getParameter("institutionName"));
        sloan.setStudyProgram(request.getParameter("studyProgram"));
        sloan.setPartTimeJob(request.getParameter("partTimeJob"));

        Loanservice service = new Loanservice();
        boolean success = service.regStdLoan(sloan);

        if (success) {
            displayAlert(response, "Success", "Loan application successfully submitted! Please check your email for further details.", "success");
        } else {
            displayAlert(response, "Error", "Error during loan application submission.", "error");
        }
    }

    private void displayAlert(HttpServletResponse response, String title, String message, String icon) throws IOException {
        response.setContentType("text/html");
        response.getWriter().write(
            "<!DOCTYPE html>" +
            "<html lang='en'>" +
            "<head>" +
            "<style>" +
            "  body {" +
            "      font-family: Arial, sans-serif;" +
            "      margin: 0;" +
            "      height: 100vh;" +
            "      display: flex;" +
            "      justify-content: center;" +
            "      align-items: center;" +
            "      background: url('./style/img/back2.png') no-repeat center center fixed;" +
            "      background-size: cover;" +
           
            "  }" +  
            "  .swal2-popup { border-radius: 15px !important; }" +  
            "  .swal2-confirm {" +
            "      background-color: #1499f1 !important;" +
            "      border:none;"+
            "      border-radius: 15px !important;" + 
            "      color: white !important;" + 
            "      padding: 10px 20px;" + 
            "      font-size: 16px;" + 
            "  }" +
            "  .blur-effect { filter: blur(8px); pointer-events: none; }" +
            "</style>" +
            "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>" +
            "</head>" +
            "<body>" +
            "<script>" +
           
            "   Swal.fire({" +
            "       title: '" + title + "'," +
            "       text: '" + message + "'," +
            "       icon: '" + icon + "'," +
            "       confirmButtonText: 'Go Back'," +
            "       allowOutsideClick: false," +
            "       allowEscapeKey: false" +
            "   }).then((result) => {" +
            "       if (result.isConfirmed) {" +
            "           window.location.href = 'loanIndex.jsp';" +
            "       }" +
            "   });" +
            "</script>" +
            "</body>" +
            "</html>"
        );
    }
}
