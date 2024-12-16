package Support_Model;

public class Support {
    private int id; // If you have an ID field
    private String customerName;
    private String nicNumber;
    private String questionType;
    private String questionDescription;

    // Constructor for creating a new support request (without ID)
    public Support(String customerName, String nicNumber, String questionType, String questionDescription) {
        this.customerName = customerName;
        this.nicNumber = nicNumber;
        this.questionType = questionType;
        this.questionDescription = questionDescription;
    }

    // Constructor for updating an existing support request (with ID)
    public Support(int id, String customerName, String nicNumber, String questionType, String questionDescription) {
        this.id = id;
        this.customerName = customerName;
        this.nicNumber = nicNumber;
        this.questionType = questionType;
        this.questionDescription = questionDescription;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getNicNumber() {
        return nicNumber;
    }

    public String getQuestionType() {
        return questionType;
    }

    public String getQuestionDescription() {
        return questionDescription;
    }
}
