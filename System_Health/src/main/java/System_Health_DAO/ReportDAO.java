package System_Health_DAO;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; 
import java.util.ArrayList;
import java.util.List;

import System_Health_Model.Report;

public class ReportDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Dilnuka@sql";

    private static final String INSERT_CRUD_RECORD_SQL = "INSERT INTO crud_records (record_id, entity_type, operation_type, initiated_by, operation_timestamp, ip_address, operation_details) VALUES (?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_CRUD_RECORD_BY_ID = "SELECT * FROM crud_records WHERE record_id = ?;";
    private static final String SELECT_ALL_CRUD_RECORDS = "SELECT * FROM crud_records;";
    private static final String DELETE_CRUD_RECORD_SQL = "DELETE FROM crud_records WHERE record_id = ?;";
    private static final String UPDATE_CRUD_RECORD_SQL = "UPDATE crud_records SET entity_type = ?, operation_type = ?, initiated_by = ?, operation_timestamp = ?, ip_address = ?, operation_details = ? WHERE record_id = ?;";

    public ReportDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            // Update driver class if necessary
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // Handle SQL exceptions
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // Handle Class not found exceptions
            e.printStackTrace();
        }
        return connection;
    }

    // Create a new CRUDRecord
    public void insertCRUDRecord(Report record) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CRUD_RECORD_SQL)) {
            preparedStatement.setString(1, record.getRecord_id());
            preparedStatement.setString(2, record.getEntity_type());
            preparedStatement.setString(3, record.getOperation_type());
            preparedStatement.setString(4, record.getInitiated_by());
            preparedStatement.setTimestamp(5, record.getOperation_timestamp());
            preparedStatement.setString(6, record.getIp_address());
            preparedStatement.setString(7, record.getOperation_details());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
            throw e;
        }
    }

    // Retrieve a CRUD Record by record_id
    public Report selectCRUDRecord(String record_id) {
        Report record = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CRUD_RECORD_BY_ID)) {
            preparedStatement.setString(1, record_id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String entity_type = rs.getString("entity_type");
                String operation_type = rs.getString("operation_type");
                String initiated_by = rs.getString("initiated_by");
                java.sql.Timestamp operation_timestamp = rs.getTimestamp("operation_timestamp");
                String ip_address = rs.getString("ip_address");
                String operation_details = rs.getString("operation_details");

                record = new Report(record_id, entity_type, operation_type, initiated_by, operation_timestamp, ip_address, operation_details);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return record;
    }

    // Retrieve all CRUDRecords
    public List<Report> selectAllCRUDRecords() {
        List<Report> records = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CRUD_RECORDS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String record_id = rs.getString("record_id");
                String entity_type = rs.getString("entity_type");
                String operation_type = rs.getString("operation_type");
                String initiated_by = rs.getString("initiated_by");
                java.sql.Timestamp operation_timestamp = rs.getTimestamp("operation_timestamp");
                String ip_address = rs.getString("ip_address");
                String operation_details = rs.getString("operation_details");

                records.add(new Report(record_id, entity_type, operation_type, initiated_by, operation_timestamp, ip_address, operation_details));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return records;
    }

    // Update an existing CRUDRecord
    public boolean updateCRUDRecord(Report record) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CRUD_RECORD_SQL)) {
            preparedStatement.setString(1, record.getEntity_type());
            preparedStatement.setString(2, record.getOperation_type());
            preparedStatement.setString(3, record.getInitiated_by());
            preparedStatement.setTimestamp(4, record.getOperation_timestamp());
            preparedStatement.setString(5, record.getIp_address());
            preparedStatement.setString(6, record.getOperation_details());
            preparedStatement.setString(7, record.getRecord_id());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete a CRUDRecord by record_id
    public boolean deleteCRUDRecord(String record_id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CRUD_RECORD_SQL)) {
            preparedStatement.setString(1, record_id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // Handle SQLExceptions
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
