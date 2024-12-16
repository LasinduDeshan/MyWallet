package System_Health_Model;

import java.sql.Timestamp;

public class Report {
    private String record_id;
    private String entity_type;
    private String operation_type;
    private String initiated_by;
    private Timestamp operation_timestamp;
    private String ip_address;
    private String operation_details;

    // Default Constructor
    public Report() {}

    //Constructor (without record_id and operation_timestamp)
    public Report(String entity_type, String operation_type, String initiated_by, String ip_address, String operation_details) {
        this.entity_type = entity_type;
        this.operation_type = operation_type;
        this.initiated_by = initiated_by;
        this.ip_address = ip_address;
        this.operation_details = operation_details;
    }

    //Constructor (with all fields)
    public Report(String record_id, String entity_type, String operation_type, String initiated_by, Timestamp operation_timestamp, String ip_address, String operation_details) {
        this.record_id = record_id;
        this.entity_type = entity_type;
        this.operation_type = operation_type;
        this.initiated_by = initiated_by;
        this.operation_timestamp = operation_timestamp;
        this.ip_address = ip_address;
        this.operation_details = operation_details;
    }

    // Getters and Setters
    public String getRecord_id() {
        return record_id;
    }

    public void setRecord_id(String record_id) {
        this.record_id = record_id;
    }

    public String getEntity_type() {
        return entity_type;
    }

    public void setEntity_type(String entity_type) {
        this.entity_type = entity_type;
    }

    public String getOperation_type() {
        return operation_type;
    }

    public void setOperation_type(String operation_type) {
        this.operation_type = operation_type;
    }

    public String getInitiated_by() {
        return initiated_by;
    }

    public void setInitiated_by(String initiated_by) {
        this.initiated_by = initiated_by;
    }

    public Timestamp getOperation_timestamp() {
        return operation_timestamp;
    }

    public void setOperation_timestamp(Timestamp operation_timestamp) {
        this.operation_timestamp = operation_timestamp;
    }

    public String getIp_address() {
        return ip_address;
    }

    public void setIp_address(String ip_address) {
        this.ip_address = ip_address;
    }

    public String getOperation_details() {
        return operation_details;
    }

    public void setOperation_details(String operation_details) {
        this.operation_details = operation_details;
    }
}
