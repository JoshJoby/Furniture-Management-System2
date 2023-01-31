<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedList" %>
<%@page import="SignUpPackage.CartModel" %>
<%@page import="SignUpPackage.HomeServlet" %>
<%@page import="SignUpPackage.SignInServlet" %>
<%@page import="SignUpPackage.RedirectToTransactionsServlet" %>
<%@page import="SignUpPackage.ProdDB"  %>
<%@page import="SignUpPackage.CartDB"  %>
<%@page import="java.util.LinkedList" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/css/dashboardStyles.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
       		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
       
        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/emojis.css">

        <!--linear icon css-->
		<link rel="stylesheet" href="assets/css/linearicons.css">

		<!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css">

        <!--owl.carousel.css-->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
		<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
		
        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- bootsnav -->
		<link rel="stylesheet" href="assets/css/bootsnav.css" >	
        
        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css">
        
        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css">
        
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/*html, body {
    overflow-x: hidden;
}*/
</style>
<body>
			<div class="top-area">
				<div class="header-area">
					<!-- Start Navigation -->
				    <nav class="navbar navbar-default bootsnav navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

				        <div class="container">            
				            <!-- Start Atribute Navigation -->
				            <div class="attr-nav">
				                <ul>			                	
				                	<li class="nav-setting">
				                	<%if(!(SignInServlet.isLoggedIn)){%>	
									<a href="SignUp.jsp" class="addMore" title="Sign in!"><p style="font-size: 12px">Sign in</p></a>
				                	<%}else{ %>
				                	<a href="dashboard.jsp" class="addMore" title="Sign in!"><p style="font-size: 12px">Dashboard</p></a>
				                	</li><!--/.search-->
				                	<%} %>
				                	<li class="nav-setting">
				                	
				                	<%if((boolean)request.getAttribute("isAuth")){%>	
				                	<div style="padding-top: 42px">						
									<form name="logout_form" method="POST" action="home.jsp">
									<span>
										<input type="submit" value="Log Out" name="btnLogOut" style="border:none; background: #f8f9fd; font-size: 12px">
									</span>
									</form>
									</div>	
				                	 <%}%>	
				                	</li><!--/.search-->            
				                    <li class="dropdown">
				                    	<%if(SignInServlet.isLoggedIn){ %>
				                        <a href="cart.jsp" >
				                        <%}else {%>
				                        <a href="#popup1">
				                        <%}%>
				                            <p style="font-size: 12px">Cart</p>
				                            <%if(HomeServlet.chosenProds.size() != 0){ %>
												<span class="badge badge-bg-1"><%=HomeServlet.chosenProds.size()%></span>
											<%}else{ %>
												<span class="badge badge-bg-1"></span>
											<%} %>
				                        </a>			                       
				                    </li><!--/.dropdown-->
				                </ul>
				            </div><!--/.attr-nav-->
				            <!-- End Atribute Navigation -->

				            <!-- Start Header Navigation -->
				            <div class="navbar-header">
				                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
				                    <i class="fa fa-bars"></i>
				                </button>
				                <a style="margin-top: -20%" class="navbar-brand" href="home.jsp">Chilli<span>Gobi!</span></a>

				            </div><!--/.navbar-header-->
				            <!-- End Header Navigation -->

				            <!-- Collect the nav links, forms, and other content for toggling -->
				            <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu" >
				                <ul class="nav navbar-nav navbar-center" data-in="fadeInDown" data-out="fadeOutUp">
				                    <li><a href="home.jsp#new-arrivals">new arrivals</a></li>
				                    <li><a href="home.jsp#feature">features</a></li>
				                    <li><a href="contactUs.jsp">contact us</a></li>
				                </ul><!--/.nav -->
				            </div><!-- /.navbar-collapse -->
				        </div><!--/.container-->
				    </nav><!--/nav-->
				    <!-- End Navigation -->
				</div><!--/.header-area-->
			    <div class="clearfix"></div>

			</div><!-- /.top-area-->
			<!-- top-area End -->
<div class="container rounded bg-white mt-5 mb-5" style="margin-left: 25%; padding-top: 2.5%">
    <div class="row">
   
        <div>
            <div class="d-flex flex-column align-items-center text-center" 
            style="margin-left: 10%; padding-right: 50%" >
            
            <%if(SignInServlet.userGender.toLowerCase().equals("male")){ %>
            <img class="rounded-circle mt-5" 
            width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
            <%}else if(SignInServlet.userGender.toLowerCase().equals("female")){ %>
            <img class="rounded-circle mt-5" 
            width="150px" src="https://st.depositphotos.com/62933612/54663/v/600/depositphotos_546638394-stock-illustration-female-user-account-user-profile.jpg">
             <%}else{ %>
            <img class="rounded-circle mt-5" 
            width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
            <%} %>
            <span class="font-weight-bold"><%=SignInServlet.userName1 + " " + SignInServlet.userName2 %></span>
            <span class="text-black-50"><%=SignInServlet.userEmail %></span><span> </span></div>
                    <br>
            
        </div> 
        <div style="margin-left: 10%; padding-right: 60%">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Update Password</h4>
                </div>
                <form name="updateUserDetails" action="dashboard.jsp" method="post">
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Old Password</label><input type="password" name="oldPassword" class="form-control" placeholder="Old Password" value=""></div>
                    <div class="col-md-12"><label class="labels">New Password</label><input type="password" name="newPassword" class="form-control" placeholder="New Password" value=""></div>
                    <div class="col-md-12"><label class="labels">Repeat New Password</label><input type="password" name="newPassword2" class="form-control" placeholder="Repeat New Password" value=""></div>
                </div>
                <div class="mt-5 text-center"><input name="updatePasswordBtn" class="btn btn-primary profile-button" type="submit" value="Save Profile"></div>
               </form>
            </div>
        </div>
    </div>
</div>
	<hr>
		<!-- clients strat -->				
		<div class="section-header" style="margin-top: 5%; margin-bottom: 5%">
					<h2>Our partners</h2>
				</div><!--/.section-header-->
<section id="clients"  class="clients" style="background-color: #ffffff">
			<div class="container" style="background-color: #ffffff">
				<div class="owl-carousel owl-theme" id="client">
						<div class="item">
							<a href="https://www.godrejinterio.com/">
								<img src="assets/images/clients/godrej.png" alt="brand-image" />
							</a>
						</div><!--/.item-->
						<div class="item">
							<a href="https://www.ikea.com/in/en/?ref=gwp-start">
								<img src="assets/images/clients/ikea.png" alt="brand-image" />
							</a>
						</div><!--/.item-->
						<div class="item">
							<a href="https://www.evok.in/">
								<img src="assets/images/clients/evokk.png" alt="brand-image" />
							</a>
						</div><!--/.item-->
						<div class="item">
							<a href="https://www.urbanladder.com/">
								<img src="assets/images/clients/urban_ladder.png" alt="brand-image" />
							</a>
						</div><!--/.item-->
						<div class="item">
							<a href="https://www.wiproseatingsolutions.com/">
								<img src="assets/images/clients/wipro.png" alt="brand-image" />
							</a>
						</div><!--/.item-->
						<div class="item">
							<a href="https://www.steelcase.com/">
								<img src="assets/images/clients/steelcase.png" alt="brand-image" />
							</a>
						</div><!--/.item-->
					</div><!--/.owl-carousel-->

			</div><!--/.container-->


		</section><!--/.clients-->	
		<!-- clients end -->

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
		
		<footer id="footer"  class="footer">
			<div class="container">
				<div class="hm-footer-copyright text-center">
					
					<p>
						designed and developed by Josh and team!
					</p><!--/p-->
				</div><!--/.text-center-->
			</div><!--/.container-->

			<div id="scroll-Top">
				<div class="return-to-top">
					<i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
				</div>
				
			</div><!--/.scroll-Top-->
			
        </footer><!--/.footer-->
		<!--footer end-->
		
		<!-- Include all js compiled plugins (below), or include individual files as needed -->

		<script src="assets/js/jquery.js"></script>
        
        <!--modernizr.min.js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
		
		<!--bootstrap.min.js-->
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- bootsnav js -->
		<script src="assets/js/bootsnav.js"></script>

		<!--owl.carousel.js-->
        <script src="assets/js/owl.carousel.min.js"></script>


		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
		
        
        <!--Custom JS-->
        <script src="assets/js/custom.js"></script>
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="assets/js/jquery.js"></script>
        
        <!--modernizr.min.js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
		
		<!--bootstrap.min.js-->
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- bootsnav js -->
		<script src="assets/js/bootsnav.js"></script>

		<!--owl.carousel.js-->
        <script src="assets/js/owl.carousel.min.js"></script>


		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
		
        
        <!--Custom JS-->
        <script src="assets/js/custom.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="assets/js/jquery.js"></script>
        
        <!--modernizr.min.js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
		
		<!--bootstrap.min.js-->
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- bootsnav js -->
		<script src="assets/js/bootsnav.js"></script>

		<!--owl.carousel.js-->
        <script src="assets/js/owl.carousel.min.js"></script>


		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
		
        
        <!--Custom JS-->
        <script src="assets/js/custom.js"></script>
</body>
</html>