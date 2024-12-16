<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>MyWallet - Loan Services</title>
  <link rel="stylesheet" href="./style/hStyle.css" >
  <link rel="icon" href="./style/img/myvault3.png" type="image/x-icon">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">  
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
      <a href="home.jsp" class="active">Home</a>
            <a href="loan.jsp" >Loans</a>
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


        <div class="lBtn">
          <button class="log">Login</button>
        </div>
       
    </div>  
  </nav>

  <!-- Hero Section -->
  <section class="hero">
    <div class="head">
      <h1>Step Into the <span style="color: #1499f1;">Future</span> of Banking</h1>
      <p>Experience the future of banking with AI-powered tools, seamless transactions, and security at every step. Empowering you to take control of your financial future.</p>
      <a href="#loan-details" class="btn">Get Started</a>
    </div>
  </section>

  <div class="con1">
    <h1>Get your referral reward</h1>
    <p>In addition to simplifying your global payments, you and the person who referred you are eligible for a reward!</p>
    <div class="sec">
      <div class="se">
        <h1>01</h1>
        <p>Open your MyWallet account with the button below</p>
      </div>
      <div class="se">
        <h1>02</h1>
        <p>Receive 1000USD or equivalent in payments</p>
      </div>
      <div class="se">
        <h1>03</h1>
        <p>You both recive 25 USD to your mywallet</p>
      </div>
    </div>
  </div>

  <div class="container">
    <!-- Loan Details Section -->
    <section class="section" id="loan-details">
      <h2>Our Services</h2>
      <p>From personal banking to business solutions, we've got you covered.</p>
      <div class="card-grid">
        <div class="card">
          <h3>Loans</h3>
          <p>Flexible loans tailored to meet your unique needs.</p>
        </div>

        <div class="card">
          <h3>Business Accounts</h3>
          <p>Comprehensive solutions to manage your business finances.</p>
        </div>

        <div class="card">
          <h3>Credit Cards</h3>
          <p>Enjoy low-interest rates and exclusive rewards on every purchase.</p>
        </div>

        <div class="card">
          <h3>Savings Accounts</h3>
          <p>Earn competitive interest rates and grow your savings.</p>
        </div>
      </div>
    </section>

    <!-- Contact Section -->
    <section class="section" id="contact">
      <h2>We're here to help</h2>
      <div class="contact">
        
        <p>If you have any questions or need guidance on selecting the best loan option, our customer support team is here to help. Contact us at <strong>support@mywallet.com</strong> or call <strong>1-800-MYWALLET</strong>.</p>
       <button class="btn">Contact us</button>
      </div>
    </section>
  </div>


  <footer class="footer">
    <div class="fcontainer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>About Us</h3>
                <p>MyWallet is an innovative online banking system designed to provide secure, accessible, and convenient banking services to customers worldwide. Our mission is to empower users by offering a seamless digital banking experience, leveraging state-of-the-art technology.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#">Home</a></li>
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



  <!-- JavaScript for smooth scrolling -->
  <script>
    document.querySelectorAll('nav a, .btn').forEach(anchor => {
      anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const targetSection = document.querySelector(this.getAttribute('href'));
        targetSection.scrollIntoView({
          behavior: 'smooth'
        });
      });
    });

    document.querySelectorAll('nav a').forEach(link => {
  link.addEventListener('click', function () {
    document.querySelectorAll('nav a').forEach(nav => nav.classList.remove('active'));
    this.classList.add('active');
   });
  });



  </script>
</body>
</html>