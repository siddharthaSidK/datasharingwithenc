<!DOCTYPE html>
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

        <jsp:include page="Menu.jsp"></jsp:include>
    </nav> <!-- end of navbar -->
    <!-- end of navbar -->


    <!-- Header -->
    <header id="header" class="header">
        <div class="header-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-container" style="margin-top: -10%;">
                            <h2 style="color: yellow">Data Sharing  in encrypted images with multiple data-hiders</h2>
                        </div>
                        <br>
                        <%String status = request.getParameter("status");
                        if(status!=null)
                        {%>
                        	<h1><%out.print(status); %></h1>	
                        <%}
                        %>
                        <%String s = request.getParameter("s");
                        if(s!=null)
                        {%>
                        	<h2 style="color: red;"><%out.print(s); %></h2>	
                        <%}
                        %>
                    </div> <!-- end of col -->
                </div> <!-- end of row -->
            </div> <!-- end of container -->
        </div> <!-- end of header-content -->
    </header> <!-- end of header -->
    <!-- end of header -->
    
<div id="Login" class="form-1">
        <div class="container">
        <div class="row">
                <div class="col-lg-12" style="margin-top: 10%;">
                    <div class="section-title" style="font-size: 25px;">Admin Login Here</div>
                    <br>
                </div> <!-- end of col -->
           </div> <!-- end of row -->
                <div class="col-lg-6" style="margin-left: 25%; margin-bottom: 25%;">
                   
                    <!-- Call Me Form -->
                    <form action="./LoginServlet" method="post" id="" data-toggle="validator" data-focus="false">
                    <div class="form-group">
                            <input type="email" class="form-control-input" id="lemail" name="email" required>
                            <label class="label-control" for="lemail">Email</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" class="form-control-input" id="lpassword" name="password" required>
                            <label class="label-control" for="lphone">Password</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        
                        <div class="form-group">
                            <button type="submit" class="form-control-submit-button">Login</button>
                        </div>
                    </form>
                    <!-- end of call me form -->
                    
                </div> <!-- end of col -->
            </div><!-- end of row -->
        </div> <!-- end of container -->
     <!-- end of form-1 -->
    <!-- end of call me -->


<div id="Login1" class="form-1">
        <div class="container">
        <div class="row">
                <div class="col-lg-12" style="margin-top: 10%;">
                    <div class="section-title" style="font-size: 25px;">Data Hider Login Here</div>
                    <br>
                </div> <!-- end of col -->
           </div> <!-- end of row -->
                <div class="col-lg-6" style="margin-left: 25%; margin-bottom: 25%;">
                   
                    <!-- Call Me Form -->
                    <form action="./LoginServlet" method="post" id="" data-toggle="validator" data-focus="false">
                    <div class="form-group">
                            <input type="email" class="form-control-input" id="lemail" name="email" required>
                            <label class="label-control" for="lemail">Email</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" class="form-control-input" id="lpassword" name="password" required>
                            <label class="label-control" for="lphone">Password</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        
                        <div class="form-group">
                            <button type="submit" class="form-control-submit-button">Login</button>
                        </div>
                    </form>
                    <!-- end of call me form -->
                    
                </div> <!-- end of col -->
            </div><!-- end of row -->
        </div> <!-- end of container -->
     <!-- end of form-1 -->
    <!-- end of call me -->
    
    
    
    <div id="Login2" class="form-1">
        <div class="container">
        <div class="row">
                <div class="col-lg-12" style="margin-top: 10%;">
                    <div class="section-title" style="font-size: 25px;">User Login Here </div>
                    <br>
                </div> <!-- end of col -->
           </div> <!-- end of row -->
                <div class="col-lg-6" style="margin-left: 25%; margin-bottom: 25%;">
                   
                    <!-- Call Me Form -->
                    <form action="./LoginServlet" method="post" id="" data-toggle="validator" data-focus="false">
                    <div class="form-group">
                            <input type="email" class="form-control-input" id="lemail" name="email" required>
                            <label class="label-control" for="lemail">Email</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" class="form-control-input" id="lpassword" name="password" required>
                            <label class="label-control" for="lphone">Password</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        
                        <div class="form-group">
                            <button type="submit" class="form-control-submit-button">Login</button>
                        </div>
                    </form>
                    <!-- end of call me form -->
                    
                </div> <!-- end of col -->
            </div><!-- end of row -->
        </div> <!-- end of container -->
     <!-- end of form-1 -->
    <!-- end of call me -->

    <!-- Call Me -->
    <div id="callMe" class="form-1">
        <div class="container">
        <div class="row">
                <div class="col-lg-12">
                    <div class="section-title" style="font-size: 25px;">Contact Us</div>
                </div> <!-- end of col -->
           </div> <!-- end of row -->
            <div class="row" style="margin-left: 25%;margin-bottom: 15%;">
                <div class="col-lg-6">
                   
                    <!-- Call Me Form -->
                    <form action="./FeedbackServlet" method="post" id="" data-toggle="validator" data-focus="false">
                        <div class="form-group">
                            <input type="text" class="form-control-input" id="lname" name="name" required>
                            <label class="label-control" for="lname">Name</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control-input" id="lemail" name="email" required>
                            <label class="label-control" for="lemail">Email</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control-textarea" id="cmessage" name="message" required></textarea>
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
        </div> <!-- end of container -->
    </div> <!-- end of form-1 -->
    <!-- end of call me -->
    
    <div id="register" class="form-1">
        <div class="container">
        <div class="row">
                <div class="col-lg-12">
                    <div class="section-title" style="font-size: 25px;">Registration Page</div>
                    <br>
                </div> <!-- end of col -->
           </div> <!-- end of row -->
            <div class="row" style="margin-left: 5%;margin-bottom: 15%;">
            <div class="col-lg-12">
            <form action="./Register" method="post" id="" data-toggle="validator" data-focus="false">
                        <div class="row form-group">
                        <div class="col-lg-6">
                            <input type="text" class="form-control-input" id="lname" name="name" required>
                            <label class="label-control" for="lname">Name</label>
                            <div class="help-block with-errors"></div>
                         </div>
                         </div>
                         <div class="row form-group">
                         <div class="col-lg-6">
                            <input type="email" class="form-control-input" id="lemail" name="email" required>
                            <label class="label-control" for="lemail">Email</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        </div>
                        <div class="row form-group">
                        <div class="col-lg-6">
                            <input type="password" class="form-control-input" id="lpassword" name="password" required>
                            <label class="label-control" for="lphone">Password</label>
                            <div class="help-block with-errors"></div>
                            </div>
                            </div>
                            <div class="row form-group">
                         <div class="col-lg-6">
                            <input type="tel" class="form-control-input" id="lphone" name="phone" pattern="[0-9]{10}" maxlength="10" required>
                            <label class="label-control" for="lphone">Phone</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        </div>
                        
                        <div class="row form-group">
                        <div class="col-lg-6">
                            <input type="date" class="form-control-input" id="lpassword" name="dob" required>
                            <label class="label-control" for="lphone">DOB</label>
                            <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        
                        
                        <div class="row form-group">
                        <div class="col-lg-6">
                            <textarea class="form-control-textarea" id="cmessage" name="address" required></textarea>
                            <label class="label-control" for="cmessage">Address</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        </div>
                        <div class="form-group">
                        <div class="col-lg-6">
                            <button type="submit" class="form-control-submit-button">Register</button>
                        </div>
                        </div>
                        <div class="form-message">
                            <div id="lmsgSubmit" class="h3 text-center hidden"></div>
                        </div>
                    </form>
                    <!-- end of call me form -->
                    
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of form-1 -->
    <!-- end of call me -->

    <!-- About -->
    <div id="about" class="counter" style="margin-top: 5%;">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-xl-12">
                    <div class="text-container">
                        <div class="section-title">ABOUT PROJECT</div>
                        <p style="text-align: justify;">The existing models of reversible data hiding in encrypted images (RDH-EI) are based on single data-hider, where the
original image cannot be reconstructed when the data-hider is damaged. To address this issue, this paper proposes a novel model with
multiple data-hiders for RDH-EI based on secret sharing. It divides the original image into multiple different encrypted images with the
same size of the original image and distributes them to multiple different data-hiders for data hiding. Each data-hider can independently
embed data into the encrypted image to obtain the corresponding marked encrypted image. The original image can be losslessly
recovered by collecting sufficient marked encrypted images from undamaged data-hiders when individual data-hiders are subjected to
potential damage. This further protects the security of the original image. We provide four cases of the proposed model, namely, two
joint cases and two separable cases. From the proposed model, we derive a separable RDH-EI method with high-capacity.
Experimental results are presented to illustrate the effectiveness of the proposed method.</p>
                    </div> <!-- end of text-container -->      
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of counter -->
    <!-- end of about -->

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