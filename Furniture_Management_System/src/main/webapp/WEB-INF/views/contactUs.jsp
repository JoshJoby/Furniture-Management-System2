<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="SignUpPackage.SignInServlet"%>
<%@page import="SignUpPackage.ProdDB"%>
<%@page import="SignUpPackage.HomeServlet"%>
<%@page import="SignUpPackage.CartDB"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/css/styleprod.css" rel="stylesheet" />
<link href="assets/css/styleprod.css" rel="stylesheet" />
<link href="assets/css/emojis.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
        <title>View Product</title>

        <!-- For favicon png -->
		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
<link rel="shortcut icon" type="image/icon"
	href="assets/logo/favicon.png" />

<!--font-awesome.min.css-->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<!--linear icon css-->
<link rel="stylesheet" href="assets/css/linearicons.css">
<link rel="stylesheet" href="assets/css/contactUs.css">

<link rel="stylesheet" href="assets/css/buttonStyles.css">
        <link rel="stylesheet" href="assets/css/emojis.css">

<!--animate.css-->
<link rel="stylesheet" href="assets/css/animate.css">

<!--owl.carousel.css-->
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

<!--bootstrap.min.css-->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<!-- bootsnav -->
<link rel="stylesheet" href="assets/css/bootsnav.css">

<!--style.css-->
<link rel="stylesheet" href="assets/css/style.css">

<!--responsive.css-->
<link rel="stylesheet" href="assets/css/responsive.css">

<style>
.disabled {
  pointer-events: none;
  opacity: 0.4;
}
</style>

</head>
<body>

	<header style="background: #ffffff;" id="home">
		<form id="formCart" action="prod.jsp" method="get"></form>

		<div id="header-carousel" class="carousel slide carousel-fade"
			data-ride="carousel">
			<div class="top-area">
				<div class="header-area">
					<!-- Start Navigation -->
					<nav class="navbar navbar-default bootsnav navbar-scrollspy"
						data-minus-value-desktop="70" data-minus-value-mobile="55"
						data-speed="1000">
						<!-- End Top Search -->
						<div class="container">
							<!-- Start Atribute Navigation -->
							<div class="attr-nav">
								<ul>
				                	<li class="nav-setting">
				                	<%if(!(SignInServlet.isLoggedIn)){%>	
									<a href="SignUp.jsp" class="addMore" title="Sign in!"><p style="font-size: 12px">Sign in</p></a>
				                	<%}else{ %>
				                	<a href="dashboard.jsp" class="addMore" title="Sign in!"><p style="font-size: 12px">Dashboard</p></a>
				                	<%} %>
				                	</li><!--/.search-->
				                	
									<!--/.search-->
									<li class="nav-setting">
										<%
										if ((boolean) request.getAttribute("isAuth")) {
										%>
										<div style="padding-top: 42px">
											<form name="logout_form" method="POST" action="home.jsp">
												<span> <input type="submit" value="Log Out"
													name="btnLogOut"
													style="border: none; background: #ffffff; font-size: 12px">
												</span>
											</form>
										</div> <%
											 }
											 %>
									</li>
									<!--/.search-->
									<li class="dropdown">
				                    	<%if(SignInServlet.isLoggedIn){ %>
				                        <a href="cart.jsp" >
				                        <%}else {%>
				                        <a href="#popup1">
				                        <%}%>
											<p style="font-size: 12px">Cart</p> <%
											 if (HomeServlet.chosenProds.size() != 0) {
											 %>
											<span class="badge badge-bg-1"><%=HomeServlet.chosenProds.size()%></span>
											<%
											} else {
											%> <span class="badge badge-bg-1"></span> <%
												 }
												 %>
									</a></li>
									<!--/.dropdown-->
								</ul>
							</div>
							<!--/.attr-nav-->
							<!-- End Atribute Navigation -->

							<!-- Start Header Navigation -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse" data-target="#navbar-menu">
									<i class="fa fa-bars"></i>
								</button>
								<a class="navbar-brand" href="home.jsp">Chilli<span>Gobi!</span></a>

							</div>
							<!--/.navbar-header-->
							<!-- End Header Navigation -->

							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse menu-ui-design"
								id="navbar-menu">
								<ul class="nav navbar-nav navbar-center" data-in="fadeInDown"
									data-out="fadeOutUp">
									<li><a href="home.jsp#new-arrivals">new
											arrivals</a></li>
									<li><a href="home.jsp#feature">features</a></li>
									<li><a href="contactUs.jsp">contact us</a></li>
								</ul>
								<!--/.nav -->
							</div>
							<!-- /.navbar-collapse -->
						</div>
						<!--/.container-->
					</nav>
					<!--/nav-->
					<!-- End Navigation -->
				</div>
				<!--/.header-area-->
				<div class="clearfix"></div>
			</div>
			<!--/#header-carousel-->

		</div>
	</header>

	<!-- clients end -->
	<section class="contact-address-area">
    <div class="container">
        <div class="sec-title-style1 text-center max-width">
            <div class="title">Contact Us</div>
            <div class="text"><div class="decor-left"><span></span></div><p>Quick Contact</p><div class="decor-right"><span></span></div></div>
        </div>
                <div class="contact-address-box row">
                    <!--Start Single Contact Address Box-->
                    <div class="col-sm-4 single-contact-address-box text-center">
                        <div class="icon-holder">
                            <span class="icon-clock-1">
                                <span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span><span class="path5"></span><span class="path6"></span><span class="path7"></span><span class="path8"></span><span class="path9"></span><span class="path10"></span><span class="path11"></span><span class="path12"></span><span class="path13"></span><span class="path14"></span><span class="path15"></span><span class="path16"></span><span class="path17"></span><span class="path18"></span><span class="path19"></span><span class="path20"></span>
                            </span>
                        </div>
                        <h1>“Design is not just what it looks like and feels like. Design is how it works.” <br><br>– Steve Jobs</h1>
                    </div>
                    <!--End Single Contact Address Box-->
                    <!--Start Single Contact Address Box-->
                    <div class="col-sm-4 single-contact-address-box main-branch">
                        <h3>find us here   !</h3>
                        <div class="inner">
                            <ul>
                                <li>
                                    <div class="title">
                                        <h4>Address:</h4>
                                    </div>
                                    <div class="text">
                                        <p>#174E/28, 1st Floor, 1st Main, Vidyanagar, Magadi Road,<br> Bangalore, Karnataka, 560023</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="title">
                                        <h4>Ph & Email:</h4>
                                    </div>
                                    <div class="text">
                                        <p>+91 978 150 679 <br> admin@chilligobi.com</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="title">
                                        <h4>Office Hrs:</h4>
                                    </div>
                                    <div class="text">
                                        <p>Mon-Fri: 9:30am - 6:30pm<br> Sat-Sun: Closed</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--End Single Contact Address Box-->
                    <!--Start Single Contact Address Box-->
                    <div class="col-sm-4 single-contact-address-box text-center">
                        <div class="icon-holder">
                            <span class="icon-question-2">
                                <span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span>
                            </span>
                        </div>
                        <h1>“Your home should be a story of who you are, and a collection of what you love.” <br><br>– Nate Berkus</h1>
                    </div>
                    <!--End Single Contact Address Box-->
        </div>
    </div>
</section>  
<!--End Contact Address Area-->  
<!--Start contact form area-->
<section class="contact-info-area">
	<%if(SignInServlet.isLoggedIn){ %>
   			<div class="container">
   	<%}else{ %>		
   	   		<div class="container disabled">
   	 <%} %>
        <div class="row"  id="feedbackDiv">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12" >
                <div class="contact-form">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="sec-title-style1 text-center max-width">
                                <div class="title">Send Your Message</div>
                                <div class="text"><div class="decor-left"><span></span></div><p>Contact Form</p><div class="decor-right"><span></span></div></div>
                            </div>
                            <div class="text-box text-center max-width" style="margin-left: 25%; margin-bottom: 5%">
                                <p style="font-size: 125%">Do leave us a description of how you felt using our website! </p>
                            </div>
                        </div> 
                    
                    <div class="inner-box">
                        <form id="formFeedBack" name="contact_form" class="default-form" action="RedirectToHome.jsp" method="get">
                            <div class="row">
                                <div class="col-xl-6 col-lg-12">
                                    <div class="row">
                                        <div class="col-xl-6">
                                            <div class="input-box">   
                                                <input type="text" name="form_name" placeholder="Name" required="">
                                            </div> 
                                             <div class="input-box"> 
                                                <input type="text" name="form_phone" placeholder="Phone" required="">
                                            </div>
                                        </div> 
                                    </div>                                  
                                    <br> 
                                </div>
                             <div class="text-box text-center max-width" style="margin-left: 25%; margin-bottom: 5%">
                                <p style="font-size: 110%">How did you feel about your time being around here? </p>
                            </div>
                                <div>
                                	<div class="emojis" style="margin-left: -1%">
									        <input name="upsetBox" type="checkbox" name="buttonFeedBack" value="upset" style=""><div class="eachEmoji" id="div1">😥</div>
									        <input name="okayBox" type="checkbox" name="buttonFeedBack" value="okay"><div class="eachEmoji" id="div2">😔</div>
									        <input name="alrightBox" type="checkbox" name="buttonFeedBack" value="alright"><div class="eachEmoji" id="div3">😐</div>
									        <input name="happyBox" type="checkbox" name="buttonFeedBack" value="happy"><div class="eachEmoji" id="div4">😀</div>
									        <input name="thrilledBox" type="checkbox" name="buttonFeedBack" value="thrilled"><div class="eachEmoji" id="div5">😇</div>
									  </div>
									 </div>
                                <div class="col-xl-6 col-lg-12">
                                    <div class="input-box">    
                                        <textarea name="feedbackText" placeholder="Your Message..." required=""></textarea>
                                    </div>
                                    <div class="button-box">
                                        <input id="form_botcheck" name="form_botcheck" class="form-control" type="hidden" value="">
                                        <button type="submit" data-loading-text="Please wait...">Send Message<span class="flaticon-next"></span></button>    
                                    </div>         
                                </div> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</section>
	<!--newsletter strat -->
	<section id="newsletter"  class="newsletter">
			<div class="container">
				<div class="hm-footer-details">
					<div class="row">
						<div class=" col-md-3 col-sm-6 col-xs-12">
							<div class="hm-footer-widget">
								<div class="hm-foot-title">
									<h4  style="font-weight: bold">information</h4>
								</div><!--/.hm-foot-title-->
								<div class="hm-foot-menu">
									<ul>
										<li><a href="https://github.com/JoshJoby">about me</a></li><!--/li-->
										<li><a href="https://www.linkedin.com/in/josh-joby-084888213/">contact</a></li><!--/li-->
										<li><a href="https://www.instagram.com/josh._.joby/">social profile</a></li><!--/li-->
									</ul><!--/ul-->
								</div><!--/.hm-foot-menu-->
							</div><!--/.hm-footer-widget-->
						</div><!--/.col-->
						<div class=" col-md-3 col-sm-6 col-xs-12">
							<div class="hm-footer-widget">
								<div class="hm-foot-title">
									<h4  style="font-weight: bold">categories</h4>
								</div><!--/.hm-foot-title-->
								<div class="hm-foot-menu">
									<ul>
										<li><p>chairs</p></li><!--/li-->
										<li><p>sofas</p></li><!--/li-->
										<li><p>tables</p></li><!--/li-->
										<li><p>shelves</p></li><!--/li-->
										<li><a href="#">and much more...</a></li><!--/li-->
									</ul><!--/ul-->
								</div><!--/.hm-foot-menu-->
							</div><!--/.hm-footer-widget-->
						</div><!--/.col-->
								<%if(SignInServlet.isLoggedIn){ %>
								<div class=" col-md-3 col-sm-6  col-xs-12">
								<%}else{ %>
								<div class=" col-md-3 col-sm-6  col-xs-12 disabled">
								<%} %>				
								<div class="hm-footer-widget">
								<div class="hm-foot-title">
									<h4  style="font-weight: bold">my accounts</h4>
								</div><!--/.hm-foot-title-->
								<div class="hm-foot-menu">
									<ul>
										<li><a href="dashboard.jsp">my account</a></li><!--/li-->
										<li><a href="dashboard.jsp#order-history">order history</a></li><!--/li-->
										<li><a href="cart.jsp">my cart</a></li><!--/li-->
									</ul><!--/ul-->
								</div><!--/.hm-foot-menu-->
							</div><!--/.hm-footer-widget-->
						</div><!--/.col-->
						
					<%if(SignInServlet.isLoggedIn){ %>
					<div class=" col-md-3 col-sm-6  col-xs-12">
					<%}else{ %>
					<div class=" col-md-3 col-sm-6  col-xs-12 disabled">
					<%} %>
							<div class="hm-footer-widget">
								<div class="hm-foot-title">
									<h4  style="font-weight: bold">feedback</h4>
								</div><!--/.hm-foot-title-->
								<%if(SignInServlet.isLoggedIn){ %>
								<form id="formFeedBack" action="contactUs.jsp#feedbackDiv"" method="get">
								<%}else{ %>
								<form id="formFeedBack" action="#popup1" method="get">
								<%} %>
								
								<div class="hm-foot-para">
									<p style="font-size: 100%">How did you feel about your time whilst going through the website!</p>
								      </div>
								
								<div class="hm-foot-para">
									<p style="font-size: 100%">  
										We would love to hear about your experience to improve our website!
									</p>
								</div><!--/.hm-foot-para-->
								<button style="margin-top: -1%" class="btn-cart welcome-add-cart" name="buttonfeedback" value="feedback">
										Go <span>to</span> feedback
								</button>
								</form>
							</div><!--/.hm-footer-widget-->
						</div><!--/.col--> 
					</div><!--/.row-->
				</div><!--/.hm-footer-details-->
				</div>
			</div>
			</div><!--/.container-->

		</section><!--/newsletter-->	
	
	<div id="popup1" class="overlay" style="padding-top:15%;">
			<div class="popup">
				<h2>Alert!</h2>
				&nbsp;
				<a class="close " href="#">&times;</a>
				<div class="content">
					Sign in to have more access to the website!.
					<br><br>
					<button class="btn-cart" style="margin-left: 40%">
					<a href="SignUp.jsp" title="Sign in!"><p style="font-size: 15px; color: white">Sign in</p></a>
					</button>		
					</div>
			</div>
		</div>
	<!--/newsletter-->
	<!--newsletter end -->

	<!--footer start-->
	<footer id="footer" class="footer">
		<div class="container">
			<div class="hm-footer-copyright text-center">
					<p>
						designed and developed by Josh and team!
					</p><!--/p-->
				<!--/p-->
			</div>
			<!--/.text-center-->
		</div>
		<!--/.container-->

		<div id="scroll-Top">
			<div class="return-to-top">
				<i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip"
					data-placement="top" title="" data-original-title="Back to Top"
					aria-hidden="true"></i>
			</div>

		</div>
		<!--/.scroll-Top-->
	</footer>
	
	
	<!--/.footer-->
	<script src="assets/js/jquery.js"></script>

	<!--modernizr.min.js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

	<!--bootstrap.min.js-->
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- bootsnav js -->
	<script src="assets/js/bootsnav.js"></script>

	<!--owl.carousel.js-->
	<script src="assets/js/owl.carousel.min.js"></script>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>


	<!--Custom JS-->
	<script src="assets/js/custom.js"></script>
</body>
</html>