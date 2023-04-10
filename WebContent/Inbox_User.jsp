<!DOCTYPE html>
<%@page import="hider.dao.ViewDAO"%>
<%@page import="hider.bean.Bean"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- SEO Meta Tags -->
    <meta name="description" content="Aria is a business focused HTML landing page template built with Bootstrap to help you create lead generation websites for companies and their services.">
    <meta name="author" content="Inovatik">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->
	<meta property="og:site_name" content="" /> <!-- website name -->
	<meta property="og:site" content="" /> <!-- website link -->
	<meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
	<meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
	<meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
	<meta property="og:url" content="" /> <!-- where do you want your post to link to -->
	<meta property="og:type" content="article" />

    <!-- Website Title -->
    <title>Index Page</title>
    
    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:500,700&display=swap&subset=latin-ext" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,600&display=swap&subset=latin-ext" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/fontawesome-all.css" rel="stylesheet">
    <link href="css/swiper.css" rel="stylesheet">
	<link href="css/magnific-popup.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	
	<!-- Favicon  -->
</head>
<body data-spy="scroll" data-target=".fixed-top">
<%
String email = (String)session.getAttribute("email");
ArrayList<Bean> al = new ViewDAO().userViewInboxFiles(email); %>
    
    <!-- Preloader -->
	<div class="spinner-wrapper">
        <div class="spinner">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>
    <!-- end of preloader -->
    

    <!-- Navbar -->
    <nav class="navbar navbar-expand-md navbar-dark navbar-custom fixed-top">
        <!-- Text Logo - Use this if you don't have a graphic logo -->
        <!-- <a class="navbar-brand logo-text page-scroll" href="index.html">Aria</a> -->

        <!-- Image Logo -->
        
        <!-- Mobile Menu Toggle Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-awesome fas fa-bars"></span>
            <span class="navbar-toggler-awesome fas fa-times"></span>
        </button>
        <!-- end of mobile menu toggle button -->

        <jsp:include page="userMenu.jsp"></jsp:include>
    </nav> <!-- end of navbar -->
    <!-- end of navbar -->
    
    <div id="register" class="form-1">
        <div class="container">
        <div class="row">
        <%String status =  request.getParameter("status");
                if(status!=null)
                {%>
                 <br>
                 <div class="col-lg-12">
                    <div class="section-title" style="font-size: 25px;"><%out.print(status); %></div>
                    <br>
                </div>
                <%}
                %>
        <%if(al.isEmpty()){ %>
        <div class="col-lg-12" style="margin-bottom: 35%;">
                    <div class="section-title" style="font-size: 25px;">InBox is Empty</div>
                    <br>
                </div>
        <%} %>
        <%if(!al.isEmpty()){ %>
                <div class="col-lg-12">
                    <div class="section-title" style="font-size: 25px;">Received Files</div>
                    <br>
                </div> <!-- end of col -->
           </div> <!-- end of row -->
            <div row style="margin-left: 15%;margin-bottom: 35%;">
            <div class="col-lg-12">
                        <div class="form-group">
                            <table border="2" style="margin-top:5%; border-color: white;">
                            <tr>
							<th style="color: white; font-family: Times New Roman; padding: 20px;">FID</th>
							<th style="color: white; font-family: Times New Roman; padding: 20px;">Fname</th>
							<th style="color: white; font-family: Times New Roman; padding: 20px;">Sender</th>
							<th style="color: white; font-family: Times New Roman; padding: 20px;">Decrypt key </th>
							<th style="color: white; font-family: Times New Roman; padding: 20px;">View</th>
                            </tr>
                            <%for(Bean b:al){ %>
                            <tr>
                            <th style="color: white; font-family: Times New Roman; padding: 20px;"><%=b.getFid() %></th>
                            <th style="color: white; font-family: Times New Roman; padding: 20px;"><%=b.getFname()%></th>
                            <th style="color: white; font-family: Times New Roman; padding: 20px;"><%=b.getEmail()%></th>
                            <th style="color: white; font-family: Times New Roman; padding: 20px;"><%=b.getPassword()%></th>
                            <th style="color: white; font-family: Times New Roman; padding: 20px;"><a href="EnterKey_User.jsp?fid=<%=b.getFid()%>" style="color: red;">View</a></th>
                            </tr>
                            <%} %>
                            </table>
                        </div>
                    <!-- end of call me form -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
            <%} %>
        </div> <!-- end of container -->
    </div> <!-- end of form-1 -->
    <!-- end of call me -->

    <!-- Scripts -->
    <script src="js/jquery.min.js"></script> <!-- jQuery for Bootstrap's JavaScript plugins -->
    <script src="js/popper.min.js"></script> <!-- Popper tooltip library for Bootstrap -->
    <script src="js/bootstrap.min.js"></script> <!-- Bootstrap framework -->
    <script src="js/jquery.easing.min.js"></script> <!-- jQuery Easing for smooth scrolling between anchors -->
    <script src="js/swiper.min.js"></script> <!-- Swiper for image and text sliders -->
    <script src="js/jquery.magnific-popup.js"></script> <!-- Magnific Popup for lightboxes -->
    <script src="js/morphext.min.js"></script> <!-- Morphtext rotating text in the header -->
    <script src="js/isotope.pkgd.min.js"></script> <!-- Isotope for filter -->
    <script src="js/validator.min.js"></script> <!-- Validator.js - Bootstrap plugin that validates forms -->
    <script src="js/scripts.js"></script> <!-- Custom scripts -->
</body>
</html>