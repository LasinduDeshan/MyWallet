package Support_DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Support_Model.Support;

public class SupportDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Dilnuka@sql";

    // SQL queries
    private static final String INSERT_SUPPORT_SQL = "INSERT INTO support (customerName, nicNumber, questionType, questionDescription) VALUES (?, ?, ?, ?);";
    private static final String SELECT_SUPPORT_BY_ID = "SELECT id, customerName, nicNumber, questionType, questionDescription FROM support WHERE id = ?;";
    private static final String SELECT_ALL_SUPPORTS = "SELECT * FROM support;";
    private static final String DELETE_SUPPORT_SQL = "DELETE FROM support WHERE id = ?;";
    private static final String UPDATE_SUPPORT_SQL = "UPDATE support SET customerName = ?, nicNumber = ?, questionType = ?, questionDescription = ? WHERE id = ?;";

    public SupportDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            // Use the correct MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertSupport(Support support) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SUPPORT_SQL)) {
            preparedStatement.setString(1, support.getCustomerName());
            preparedStatement.setString(2, support.getNicNumber());
            preparedStatement.setString(3, support.getQuestionType());
            preparedStatement.setString(4, support.getQuestionDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Support selectSupport(int id) {
        Support support = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SUPPORT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String customerName = rs.getString("customerName");
                String nicNumber = rs.getString("nicNumber");
                String questionType = rs.getString("questionType");
                String questionDescription = rs.getString("questionDescription");
                support = new Support(id, customerName, nicNumber, questionType, questionDescription);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return support;
    }

    public List<Support> selectAllSupports() {
        List<Support> supports = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SUPPORTS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String customerName = rs.getString("customerName");
                String nicNumber = rs.getString("nicNumber");
                String questionType = rs.getString("questionType");
                String questionDescription = rs.getString("questionDescription");
                supports.add(new Support(id, customerName, nicNumber, questionType, questionDescription));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return supports;
    }

    public boolean updateSupport(Support support) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_SUPPORT_SQL)) {
            statement.setString(1, support.getCustomerName());
            statement.setString(2, support.getNicNumber());
            statement.setString(3, support.getQuestionType());
            statement.setString(4, support.getQuestionDescription());
            statement.setInt(5, support.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean deleteSupport(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_SUPPORT_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
