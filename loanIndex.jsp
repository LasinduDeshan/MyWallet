<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Application</title>
    <link rel="stylesheet" href="./style//prac3.css">
    <link rel="icon" href="./style/img/myvault3.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/33f0f5de01.js" crossorigin="anonymous"></script>
</head>
<body>

      <!-- Navigation Bar -->
      <nav>
        <div class="logo">
            <img src="./style/img/myvault2.png" alt="MyWallet Logo">
        </div>
        <div class="nav2">
            <a href="home.jsp">Home</a>
            <a href="loan.jsp" class="active">Loans</a>
            <div class="dropdown">
                <a href="#" class="dropdown-toggle">Services  <i class="fa-solid fa-chevron-down"></i></a>
                <div class="dropdown-menu">
                <a href="account.html">Account Management</a>
                <a href="payment.html">Payment Services</a>
                <a href="investment.html">Investment Options</a>
                </div>
            </div>
            <a href="contact.html">Contact Us</a>
            <a href="contact.html">About Us</a>

        </div>  
        
        <div class="profile-pic">

            <div class="proName">
                <p>Andrew Garfield</p>
            </div>  
            <img src="./style/img/andrew-garfield-says-spider-man-across-the-spider-verse-is-v0-ryo6cjfrjp4c1.webp" alt="Profile Picture">
        </div>
    </nav>


    <div class="header">
        <h1>Select Your <span style="color: #1499f1;">Loan</span> Type</h1>
        <p>Ensure you meet the basic eligibility criteria before selecting a loan type to avoid delays in processing. If the application provides a save feature, use it to prevent losing your progress. For any questions or concerns, feel free to reach out through the Help or Contact Us link for prompt assistance.</p>

        <div class="btn-container">
            <button id="studentLoanBtn" onclick="showForm('student', this)">Student Loan</button>
            <button id="personalLoanBtn" onclick="showForm('personal', this)">Personal Loan</button>
            <button id="businessLoanBtn" onclick="showForm('business', this)">Business Loan</button>
        </div>
    </div>


    

    <div class="log_con" id="student">
        <div class="left-side">
            <img src="./style/img/adorable-junior-with-schoolbag-studio.jpg" alt="Placeholder Image">
        </div>
        <div class="right-side">
            <div class="form-container">
                <form class="loan-form" method="post" action="addStdLoan">
                    <h2>Student Loan Application</h2>
        
                    <div class="row">
                        <div class="half-width">
                            <label for="accountNumber">Account Number</label>
                            <input type="text" name="accountNumber" id="accountNumber" placeholder="Enter account number" required>
                            <span id="accountError" style="color: blue; display: none; font-size:12px;">Account number must start with "MW" followed by 5 digits</span>
                        </div>
                        <div class="half-width">
                            <label for="nicNumber">NIC Number</label>
                            <input type="text" name="nicNumber" id="nicNumber" placeholder="Enter NIC number" required>
                            <span id="nicError" style="color: blue; display: none; font-size:12px;">NIC should be 12 digits or 10 digits followed by 'V' or 'v'.</span>
                        </div>
                    </div>
        
                    <label for="loanNickname">Loan Nickname</label>
                    <input type="text" name="loanNickname" id="loanNickname" placeholder="Enter loan nickname" required>
        
                    <div class="row">
                        <div class="half-width">
                            <label for="tuitionFee">Tuition Fee</label>
                            <input type="number" id="tuitionFee" name="tuitionFee" placeholder="Enter tuition fee" required>
                        </div>
                        <div class="half-width">
                            <label for="courseDuration">Course Duration (Years)</label>
                            <div class="radio-buttons">
                                <label><input type="radio" name="courseDuration" value="1" required> 1</label>
                                <label><input type="radio" name="courseDuration" value="2" required> 2</label>
                                <label><input type="radio" name="courseDuration" value="3" required> 3</label>
                                <label><input type="radio" name="courseDuration" value="4" required> 4</label>
                                <label><input type="radio" name="courseDuration" value="5" required> 5</label>
                            </div>
                        </div>
                    </div>
        
                    <label for="institutionName">Institution Name</label>
                    <input type="text" id="institutionName" name="institutionName" placeholder="Enter institution name" required>
        
                    <div class="row">
                        <div class="half-width">
                            <label for="studyProgram">Study Program</label>
                            <select id="studyProgram" name="studyProgram" required>
                                <option value="" disabled selected>Select a study program</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="Engineering">Engineering</option>
                                <option value="Business Administration">Business Administration</option>
                                <option value="Medicine">Medicine</option>
                                <option value="Law">Law</option>
                                <option value="Education">Education</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="half-width">
                            <label for="livingExpenses">Monthly Living Expenses</label>
                            <input type="number" id="livingExpenses" name="monthlyLivingExpenses" placeholder="Enter monthly living expenses" required>
                        </div>
                    </div>
        
                    <div class="row">
                        <div class="half-width">
                            <label for="partTimeJob">Part-Time Job (if any)</label>
                            <input type="text" id="partTimeJob" name="partTimeJob" placeholder="Enter part-time job (optional)" required>
                        </div>
                        <div class="half-width">
                            <label for="studentDuration">Loan Duration (Years)</label>
                            <input type="number" id="studentDuration" name="loanDuration" placeholder="Enter loan duration" required>
                        </div>
                    </div>
        
                    <button type="submit" class="submit-btn">Submit Application</button>
                </form>
            </div>
        </div>
    </div>

    <div class="log_con" id="personal" style="display: none;">
        <div class="left-side">
            <img src="./style/img/smiling-brunette-woman-shirt-sitting-floor-with-laptop-computer-credit-card-while-looking-camera-gray.jpg" alt="Placeholder Image">
        </div>
        <div class="right-side">
            <div class="form-container">
                <form class="loan-form" method="post" action="addPersonalLoan">
                    <h2>Personal Loan Application</h2>
                    <!-- Add 10 input fields for Personal Loan -->
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" placeholder="Enter full name"required>
                    
                    <div class="row">
                        <div class="half-width">
                            <label for="income">Monthly Income</label>
                            <input type="number" id="income" name="income" placeholder="Enter monthly income" required>
                        </div>
                        <div class="half-width">
                            <label for="loanAmount">Loan Amount</label>
                            <input type="number" id="loanAmount" name="loanAmount" placeholder="Enter loan amount" required>
                        </div>
                    </div>
                    
                    <label for="loanPurpose">Loan Purpose</label>
                    <input type="text" id="loanPurpose" name="loanPurpose" placeholder="Enter loan Purpose" required>

                    <div class="row">
                        <div class="half-width">
                            <label for="dob">Date of Birth</label>
                            <input type="date" id="dob" name="dob" placeholder="Enter date of birth" required>
                        </div>
                        <div class="half-width">
                            <label for="employmentStatus">Employment Status</label>
                            <select id="employmentStatus" name="employmentStatus" required>
                                <option value="" disabled selected>Select Status</option>
                                <option value="Employed">Employed</option>
                                <option value="Self-Employed">Self-Employed</option>
                                <option value="Unemployed">Unemployed</option>
                            </select>
                        </div>
                    </div>
                    
                    

                    <div class="row">
                        <div class="half-width">
                            <label for="maritalStatus">Marital Status</label>
                            <input type="text" id="maritalStatus" name="maritalStatus" placeholder="Enter marital Status" required>
                        </div>
                        <div class="half-width">
                            <label for="contactNumber">Contact Number</label>
                            <input type="tel" id="contactNumber" name="contactNumber" placeholder="Enter contact number" required>
                        </div>
                    </div>
                    
                    
                    <label for="address">Residential Address</label>
                    <input type="text" id="address" name="address" placeholder="Enter residential address" required>
                    <button type="submit" class="submit-btn">Submit Application</button>
                </form>
            </div>
        </div>
    </div>

    <div class="log_con" id="business" style="display: none;">
        <div class="left-side">
            <img src="./style/img/business-finance-employment-female-successful-entrepreneurs-concept-young-confident-businesswoman-glasses-showing-thumbs-up-gesture-hold-laptop-guarantee-best-service-quality.jpg" alt="Placeholder Image">
        </div>
        <div class="right-side">
            <div class="form-container">
                <form class="loan-form" method="post" action="addBusinessLoan">
                    <h2>Business Loan Application</h2>
                    <!-- Add 10 input fields for Business Loan -->
                    <label for="businessName">Business Name</label>
                    <input type="text" id="businessName" name="businessName" placeholder="Enter business name" required>

                    <div class="row">
                        <div class="half-width">
                            <label for="registrationNumber">Registration Number</label>
                            <input type="text" id="registrationNumber" name="registrationNumber" placeholder="Enter registration number" required>
                        </div>
                        <div class="half-width">
                            <label for="businessType">Business Type</label>
                            <input type="text" id="businessType" name="businessType" placeholder="Enter business type" required>
                        </div>
                    </div>

                    
                    <div class="row">
                        <div class="half-width">
                            <label for="annualRevenue">Annual Revenue</label>
                            <input type="number" id="annualRevenue" name="annualRevenue" placeholder="Enter annual revenue" required>
                        </div>
                        <div class="half-width">
                            <label for="loanAmount">Loan Amount</label>
                            <input type="number" id="loanAmount" name="loanAmount" placeholder="Enter loan amount" required>
                        </div>
                    </div>

                    <label for="businessContact">Business Contact</label>
                    <input type="tel" id="businessContact" name="businessContact" placeholder="Enter business contact" required>

                    <div class="row">
                        <div class="half-width">
                            <label for="businessLocation">Business Location</label>
                            <input type="text" id="businessLocation" name="businessLocation" placeholder="Enter business location" required>
                        </div>
                        <div class="half-width">
                            <label for="employeesCount">Number of Employees</label>
                            <input type="number" id="employeesCount" name="employeesCount" placeholder="Enter number of employees" required>
                        </div>
                    </div>
                    
                    
                    
                    <label for="businessPurpose">Purpose of Loan</label>
                    <input type="text" id="businessPurpose" name="businessPurpose" placeholder="Enter Purpose of loan" required>
                   
                    <button type="submit" class="submit-btn">Submit Application</button>
                </form>
            </div>
        </div>
    </div>


    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>About Us</h3>
                    <p>MyWallet is an innovative online banking system designed to provide secure, accessible, and convenient banking services to customers worldwide. Our mission is to empower users by offering a seamless digital banking experience, leveraging state-of-the-art technology.</p>
                </div>
                <div class="footer-section">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="loan.jsp">Loans</a></li>
                        <li><a href="#">Services</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Contact Info</h3>
                    <p>Email: info@MyWallet.com</p>
                    <p>Phone: +1 234 567 890</p>
                    <p>Address: 123 Textile Avenue, Fabric City, TX 12345</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 MyWallet. All rights reserved.</p>
            </div>
        </div>
      </footer>

    <script>
        function showForm(formId, btn) {
            const forms = document.querySelectorAll('.log_con');
            const buttons = document.querySelectorAll('.btn-container button');

            forms.forEach(form => form.style.display = 'none');
            buttons.forEach(button => button.classList.remove('active'));

            document.getElementById(formId).style.display = 'flex';
            btn.classList.add('active');
        }
        
        
        document.getElementById('nicNumber').addEventListener('input', function () {
            const nicInput = this.value;
            const nicError = document.getElementById('nicError');

            // Validation
            const nicPattern = /^(\d{12}|\d{10}[Vv])$/;

            if (!nicPattern.test(nicInput)) {
                nicError.style.display = 'block'; 
            } else {
                nicError.style.display = 'none';  
            }
            
           
        });
        
        const accountInput = document.getElementById("accountNumber");
        const accountError = document.getElementById("accountError");

        accountInput.addEventListener("input", function() {
            const accountPattern = /^MW\d{5}$/;
            if (!accountPattern.test(accountInput.value)) {
                accountError.style.display = "inline";
            } else {
                accountError.style.display = "none";
            }
        });
    </script>
    
    
</body>
</html>
