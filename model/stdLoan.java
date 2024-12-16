package model;

public class stdLoan {
	
	//variable declaration
    private int stdLoanAppID;
    private String accountNumber;
    private String nicNumber;
    private String loanNickname;
    private double tuitionFee;
    private int courseDuration;
    private String institutionName;
    private String studyProgram;
    private double monthlyLivingExpenses;
    private String partTimeJob;
    private int loanDuration;

    // Constructors
    public stdLoan() {
    }

    public stdLoan(int stdLoanAppID, String accountNumber, String nicNumber, String loanNickname, double tuitionFee, int courseDuration, String institutionName, String studyProgram, double monthlyLivingExpenses, String partTimeJob, int loanDuration) {
        this.stdLoanAppID = stdLoanAppID;
        this.accountNumber = accountNumber;
        this.nicNumber = nicNumber;
        this.loanNickname = loanNickname;
        this.tuitionFee = tuitionFee;
        this.courseDuration = courseDuration;
        this.institutionName = institutionName;
        this.studyProgram = studyProgram;
        this.monthlyLivingExpenses = monthlyLivingExpenses;
        this.partTimeJob = partTimeJob;
        this.loanDuration = loanDuration;
    }

    // Getters and Setters
    public int getStdLoanAppID() {
        return stdLoanAppID;
    }

    public void setStdLoanAppID(int stdLoanAppID) {
        this.stdLoanAppID = stdLoanAppID;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getNicNumber() {
        return nicNumber;
    }

    public void setNicNumber(String nicNumber) {
        this.nicNumber = nicNumber;
    }

    public String getLoanNickname() {
        return loanNickname;
    }

    public void setLoanNickname(String loanNickname) {
        this.loanNickname = loanNickname;
    }

    public double getTuitionFee() {
        return tuitionFee;
    }

    public void setTuitionFee(double tuitionFee) {
        this.tuitionFee = tuitionFee;
    }

    public int getCourseDuration() {
        return courseDuration;
    }

    public void setCourseDuration(int courseDuration) {
        this.courseDuration = courseDuration;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public String getStudyProgram() {
        return studyProgram;
    }

    public void setStudyProgram(String studyProgram) {
        this.studyProgram = studyProgram;
    }

    public double getMonthlyLivingExpenses() {
        return monthlyLivingExpenses;
    }

    public void setMonthlyLivingExpenses(double monthlyLivingExpenses) {
        this.monthlyLivingExpenses = monthlyLivingExpenses;
    }

    public String getPartTimeJob() {
        return partTimeJob;
    }

    public void setPartTimeJob(String partTimeJob) {
        this.partTimeJob = partTimeJob;
    }

    public int getLoanDuration() {
        return loanDuration;
    }

    public void setLoanDuration(int loanDuration) {
        this.loanDuration = loanDuration;
    }
}
