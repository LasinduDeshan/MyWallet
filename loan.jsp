<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./style/lStyle.css">
<link rel="icon" href="./style/img/myvault3.png" type="image/x-icon">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

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

	 <!-- Hero Section -->
    <header class="hero-section">
        <div class="hero-content">
            <h1>Choose the <span style="color: #1499f1; ;">Best</span> loan</h1>
            <h1 id="subTitle"><span style="color: #1499f1; ;">Apply</span> Now!</h1>
            <p>Explore our diverse loan options tailored to fit your unique needs. Get started today and pave your way to financial success.</p>
            
	    	<a href="loanIndex.jsp"><button class="apply" type="submit">Apply Now!</button></a>

            
        </div>
    </header>


   
    


    <!-- Loan Descriptions Section -->
    <section class="loan-description">
     
        <div class="loan-types">
            <div class="loan-card">
                <div class="icon">
                    <img src="./style/img/pIcon.png" alt="" width="80px">
                </div>
                <h3>Personal Loan</h3>
                <p>Perfect for personal projects and unexpected expenses. Competitive rates and flexible terms.</p>
            </div>
            <div class="loan-card">
                <div class="icon">
                    <img src="./style/img/bIcon.png" alt="" width="80px">
                </div>
                <h3>Business Loan</h3>
                <p>Secure your dream home with our low-interest home loans and easy repayment plans.</p>
            </div>
            <div class="loan-card">
                <div class="icon">
                    <img src="./style/img/sIcon.png" alt="" width="80px">
                </div>
                <h3>Student Loan</h3>
                <p>Invest in your future with our student loans, designed to make education more affordable.</p>
            </div>
            
        </div>
    </section>


     <!-- Loan Description Section Below Header -->
     <section class="loan-intro">
        <h2><span style="color: #1499f1; ; font-size: 74px;">Why</span> Choose Our Loans?</h2>
        <p>Our loans offer competitive interest rates, flexible terms, and quick approval processes. Whether you're planning a personal project, expanding your business, or investing in education, we have a loan solution for you.</p>
    </section>


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
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Loans</a></li>
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


    
    

	

</body>
</html>