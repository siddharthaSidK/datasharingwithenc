<!DOCTYPE html>
<%@page import="hider.bean.Bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hider.dao.ViewDAO"%>
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
    <%int uid = (Integer)session.getAttribute("uid");
    ArrayList<Bean> al = new ViewDAO().userViewUsers(uid);
    %>
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


    <!-- Call Me -->
    <div id="callMe" class="form-1">
        <div class="container">
        <%String status = request.getParameter("status");
        if(status!=null)
        {%>
        <div class="row">
                <div class="col-lg-12">
                    <div class="section-title" style="font-size: 25px;"><%out.print(status); %></div>
                </div> <!-- end of col -->
        </div> <!-- end of row -->
        <%}
        %>
        
        <%if(al.isEmpty()){ %>
        <div class="row">
                <div class="col-lg-12">
                    <div class="section-title" style="font-size: 25px;margin-bottom: 39%;">No Users To Display</div>
                </div> <!-- end of col -->
        </div> <!-- end of row -->
        <%} %>
        <%if(!al.isEmpty()){ %>
        <div class="row">
                <div class="col-lg-12">
                    <div class="section-title" style="font-size: 25px;">Send Message</div>
                </div> <!-- end of col -->
           </div> <!-- end of row -->
            <div class="row" style="margin-left: 25%;margin-bottom: 15%;">
                <div class="col-lg-6">
                   
                    <!-- Call Me Form -->
                    <form action="./SendMessageServlet_User" method="post" id="" data-toggle="validator" data-focus="false" enctype="multipart/form-data">
                        <div class="form-group">
                        	<select class="form-control-input" name="user" id="lselect" required="">
                        	<option value="">Select User Mail</option>
                        	<%for(Bean b:al){ %>
                        	<option value="<%=b.getEmail() %>"><%=b.getEmail() %></option>
                        	<%} %>
                        	</select>
                        	<div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <input type="file" class="form-control-input" id="lfile" id="ljpg" name="file" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control-textarea" name="message" id="cmessage" required></textarea>
                            <label class="label-control" for="cmessage">Your message</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        
                        <div class="form-group">
                            <button type="submit" class="form-control-submit-button">Submit</button>
                        </div>
                        <div class="form-message">
                            <div id="lmsgSubmit" class="h3 text-center hidden"></div>
                        </div>
                    </form>
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