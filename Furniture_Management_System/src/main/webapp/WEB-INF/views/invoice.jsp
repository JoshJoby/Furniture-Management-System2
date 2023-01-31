<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SignUpPackage.InvoiceDB"  %>
<%@page import="SignUpPackage.HomeServlet"  %>
<%@page import="SignUpPackage.SignInServlet"  %>
<%@page import="SignUpPackage.CartDB"  %>
<%@page import="SignUpPackage.InvoiceModel"  %>
<%@page import="SignUpPackage.RedirectToTransactionsServlet"  %>



<%InvoiceDB idb = new InvoiceDB();
float amountDue = 0;%>
<%for(InvoiceModel invoiceModel : RedirectToTransactionsServlet.selectedProds){ 
	amountDue += invoiceModel.getProdTotalCost();
} %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>

        <title>Invoice</title>

        <!-- For favicon png -->
		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
    <link href="assets/css/styleprod.css" rel="stylesheet"/>
    <link href="assets/css/styleprod.css" rel="stylesheet"/>
    		<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    
		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
               <link rel="stylesheet" href="assets/css/emojis.css">
       
        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/buttonStyles.css">

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

<header style="background: #ffffff;" id="home">
<div id="header-carousel" class="carousel slide carousel-fade" data-ride="carousel">
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
				                	<%} %>
				                	</li><!--/.search-->
				                	<li class="nav-setting">
				                	
				                	<%if((boolean)request.getAttribute("isAuth")){%>	
				                	<div style="padding-top: 42px">						
									<form name="logout_form" method="POST" action="home.jsp">
									<span>
										<input type="submit"  value="Log Out" name="btnLogOut" style="border:none; background: #ffffff; font-size: 12px">
									</span>
									</form>
									</div>	
				                	 <%}%>	
				                	</li><!--/.search-->
				                	<li class="dropdown">
				                        <a href="cart.jsp" >
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
				                <a class="navbar-brand" href="home.jsp" style="font-weight: bold">Chilli<span>Gobi!</span></a>

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
				        			<hr>
				        
				    </nav><!--/nav-->
				    <!-- End Navigation -->
				    
				</div><!--/.header-area-->
			    <div class="clearfix"></div>
			</div>
			</div>
</header>

<script>
	var doc = new jsPDF();
	 function saveDiv(divId, title) {
	 doc.fromHTML(`<html><head><title>${title}</title></head><body>` + document.getElementById(divId).innerHTML + `</body></html>`);
	 doc.save('invoice.pdf');
	}
</script>

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	
	<title>Editable Invoice</title>
	
	<link rel='stylesheet' type='text/css' href='assets/css/styleInvoice.css' /> 
	<link rel='stylesheet' type='text/css' href='assets/css/print.css' media="print" />
</head>

<body>
	<br><br>
	<div>
		<div id='page-wrap'>
		<p id="header">INVOICE</p>
		
		<div id="identity">
			
            <div id="address" style="margin-top: 5%; "><u>Customer Address</u><br><p style="font-size: 125%"><%=SignInServlet.userAddress + ", " + SignInServlet.userCountry%></p></div>

            <div style="padding-left: 70%;">

              <img id="image" src="assets/images/logo/logoImage.png" alt="logo" style="filter: grayscale(100%); margin-top: -7%" />
            </div>
		
		</div>
		
		<div style="clear:both"></div>
					<u>Customer Name</u>
		<br>
		<div id="customer">
            <div id="customer-title" style="font-size: 200%"><p><%=SignInServlet.userName1 + " " +  SignInServlet.userName2%></p></div>
        <br>
        <br>
        		<div style="clear:both"></div>
					<u>Customer Phone number</u>
		<br>
		<div id="customer">
            <div id="customer-title" style="font-size: 200%"><p><%=SignInServlet.userPhoneno%></p></div>   
           
            <table id="meta">
                <tr style="line-height: 250%">
    		  <%for(InvoiceModel invoiceModel : RedirectToTransactionsServlet.selectedProds){ %>
                
                    <td class="meta-head" style="text-align:center; font-size: 125%">Invoice #</td>
                    <td style="text-align:center; font-size: 125%"><u><%=invoiceModel.getTransactionID() %></u></td>
                </tr>
                <tr style="line-height: 250%">

                    <td class="meta-head" style="text-align:center; font-size: 125%">Date</td>
                    <td style="text-align:center; font-size: 125%"><p id="date"><%=invoiceModel.getDateOfPurchase() %></p></td>
                </tr>
                <%break; } %>
                <tr style="line-height: 250%">
                    <td class="meta-head"><p style="text-align:center">Amount Due</p></td>
                    <td style="text-align:center; font-size: 125%"><div class="due">₹<%=amountDue %></div></td>
                </tr>

            </table>
		
		</div>
		
		<table id="items">
		
		  <tr style="line-height: 200%">
		  	  <th style="text-align:center">Product ID</th>
		      <th style="text-align:center">Item</th>
		      <th style="text-align:center">Category</th>
		      <th style="text-align:center">Unit Cost</th>
		      <th style="text-align:center">Quantity</th>
		      <th colspan="3" style="text-align:center">Price</th>
		  </tr>
		  <%for(InvoiceModel invoiceModel : RedirectToTransactionsServlet.selectedProds){ %>
		  <tr style="line-height: 250%">
		      <td class="item-name"><div  style="text-align:center"><p><%=invoiceModel.getProdID() %></p></div></td>
		      <td class="item-name"><div class="delete-wpr" style="text-align:center"><p><%=invoiceModel.getProdName() %></p></div></td>
		      <td class="cost" style="text-align:center"><p><%=invoiceModel.getProdCategory() %></p></td>
		      <td><p class="cost" style="text-align:center">₹<%=invoiceModel.getProdCost() %></p></td>
		      <td><p class="qty" style="text-align:center"><%=invoiceModel.getProdQuantity()%></p></td>
		      <td colspan="2" style="text-align:center"><span class="item-name ">₹<%=invoiceModel.getProdTotalCost() %></span></td>
		  </tr>		   
		  <%} 
		  RedirectToTransactionsServlet.selectedProds.clear();
		  %>
		  <tr  style="line-height: 250%">
		  	  <td colspan="5" class="total-line"><br></td>
		  </tr>
		  <tr style="line-height: 250%">
		      <td colspan="5" class="total-line">Subtotal&emsp;</td>
		      <td colspan="5"><div id="subtotal" style="text-align:center">₹<%=amountDue%></div></td>
		  </tr>
		  <tr style="line-height: 250%">

		      <td colspan="5" class="total-line">Tax (5%)&emsp;</td>
		      <td colspan="5"><div id="total" style="text-align:center">₹<%=String.format("%.2f",amountDue*0.05)%></div></td>
		  </tr>
		  <tr style="line-height: 250%">
		      <td colspan="5" class="total-line">Shipping&emsp;</td>
		      <td colspan="5"><p id="paid" style="text-align:center">₹100.00</p></td>
		  </tr>
		  <tr style="line-height: 250%">
		      <td colspan="5" class="total-line balance"><u>Amount Due</u>&emsp;</td>
		      <td colspan="5"><div class="due" style="text-align:center; font-weight: bold;">₹<%=String.format("%.2f",amountDue*1.05 + 100)%></div></td>
		  </tr>
		
		</table>
		<br>
		<hr>
		<br>
		<aside>
			<p style="text-align:center" >Thank you for shopping with us!</p>
		</aside>	
		
		</div>

	</div>

	
	<hr>
		<!-- clients strat -->				
		<div class="section-header" style="margin-top: 5%; margin-bottom: 5%">
					<h2>Our partners</h2>
				</div><!--/.section-header-->

		<!-- clients strat -->
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
								<form id="formFeedBack" action="contactUs.jsp" method="get">
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
		<!--newsletter end -->
		<div id="popup1" class="overlay" style="padding-top:15%;">
			<div class="popup">
				<h2>Alert!</h2>
				&nbsp;
				<a class="close " href="#home">&times;</a>
				<div class="content">
					To access the cart, you must log in, so that any changes to the cart will be autosaved.
					<br><br>
					<button class="btn-cart" style="margin-left: 40%">
					<a href="SignUp.jsp" title="Sign in!"><p style="font-size: 15px; color: white">Sign in</p></a>
					</button>
					</div>
			</div>
		</div>
		</div>
		<!--footer start-->
		<footer id="footer"  class="footer">
			<div class="container">
				<div class="hm-footer-copyright text-center">

					<p>
						designed and developed by Josh and team!
					</p><!--/p-->
				</div><!--/.text-center-->
			</div><!--/.container-->
	
</body>


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
</html>