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
<%CartDB cdb = new CartDB();
ProdDB pdb = new ProdDB();%>

<meta charset="UTF-8">
        <title>View Cart</title>

        <!-- For favicon png -->
		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
<meta charset="UTF-8">
    <link href="assets/css/styleprod.css" rel="stylesheet"/>
    <link href="assets/css/styleprod.css" rel="stylesheet"/>
    		<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    
		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
       
        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/cartStyles.css">
		<link rel="stylesheet" href="assets/css/buttonStyles.css">
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
        
        
</head>
<body>
        <form id="deleteFromCart" action="Redirect.jsp" method="get"></form>
		<form id="formAddToCart" action="Redirect.jsp" method="get"></form>
		<form id="formCart" action="prod.jsp" method="get"></form>
		
<header style="background: #ffffff;" id="home">
<div id="header-carousel" class="carousel slide carousel-fade" data-ride="carousel">
	<div class="top-area">
				<div class="header-area">
					<!-- Start Navigation -->
				    <nav class="navbar navbar-default bootsnav navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

				        <!-- Start Top Search -->

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
				                	<li class="nav-setting">
				                	
				                	<%if((boolean)request.getAttribute("isAuth")){%>	
				                	<div style="padding-top: 42px">						
									<form name="logout_form" method="POST" action="home.jsp">
									<span>
										<input type="submit"  value="Log Out" name="btnLogOut" style="border:none; background: #ffffff; font-size: 12px;font-weight : normal">
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
				                <a class="navbar-brand" href="home.jsp">Chilli<span>Gobi!</span></a>

				            </div><!--/.navbar-header-->
				            <!-- End Header Navigation -->

				            <!-- Collect the nav links, forms, and other content for toggling -->
				            <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu" >
				                <ul class="nav navbar-nav navbar-center" data-in="fadeInDown" data-out="fadeOutUp">
				                    <li><a href="home.jsp#new-arrivals">new arrivals</a></li>
				                    <li><a href="home.jsp#feature">featured</a></li>
				                    <li><a href="contactUs.jsp">contact us</a></li>
				                </ul><!--/.nav -->
				            </div><!-- /.navbar-collapse -->
				        </div><!--/.container-->
				    </nav><!--/nav-->
				    <!-- End Navigation -->
				</div><!--/.header-area-->
			    <div class="clearfix"></div>
			</div>
			</div>
</header>

<div style="margin-left:6.4%; font-weight: bold; margin-bottom: 1%">Shopping Cart</div>

<div class="shopping-cart">

  <div class="column-labels">
    <label class="product-image">Image</label>
    <label class="product-details">Product</label>
    <label class="product-price">Price</label>
    <label class="product-quantity">Quantity</label>
    <label class="product-removal">Remove</label>
    <label class="product-line-price">Total</label>
  </div>

	
	<%double cost1 = 0.0;
	for(CartModel cm : HomeServlet.chosenProds){ %>
	
  <div class="product">
    <div class="product-image">
    <button type="submit" name="buttonProd" value="<%=cm.getProdID()%>" form="formCart">
      <img style="margin-top: 75%" src=<%=cm.getProdImage()%>>
    </button>
    </div>
    <div class="product-details">
      <div class="product-title"><u style="font-size: 125%"><%=cm.getProdName()%></u></div>
      <p class="product-description" style="font-weight: normal"><%=cm.getProdDesc()%></p>
    </div>
    <div class="product-price" style="font-weight: normal"><%=cm.getProdCost()%></div>
    <div class="product-quantity">
      <p style="font-weight: normal"><%=cm.getProdSelectedQuantity()%></p>
    </div>
    <div class="product-removal">
      <button class="remove-product" name="removeButton" type="submit" value="<%=cm.getProdID()%>" form="deleteFromCart">
        Remove
      </button>
    </div>
    <div class="product-line-price" style="font-weight: normal"><%=cm.getTotalProdCost()%></div>
  </div>
  <%cost1 += cm.getTotalProdCost();
  } %>

  

  <div class="totals" style="font-size: 19px">
    <div class="totals-item">
      <label>Subtotal</label>
      <div class="totals-value" id="cart-subtotal"><%=String.format("%.2f",(cost1))%></div>
      <%RedirectToTransactionsServlet.subtotal =  String.format("%.2f",(cost1));%>
    </div>
    <div class="totals-item">
      <label>Tax (5%)</label>
      <div class="totals-value" id="cart-tax"><%=String.format("%.2f",cost1*0.05) %></div>
       <%RedirectToTransactionsServlet.tax =  String.format("%.2f",cost1*0.05);%>
      
    </div>
    <div class="totals-item">
      <label>Shipping</label>
      <div class="totals-value" id="cart-shipping">100.00</div>
    </div>
    <div class="totals-item totals-item-total">
      <label>Grand Total</label>
      <div class="totals-value" id="cart-total"><%=String.format("%.2f",cost1*1.05 + 100.00)%></div>
      <%CartDB.totalCost = String.format("%.2f",cost1*1.05 + 100.00);
        RedirectToTransactionsServlet.total = String.format("%.2f",cost1*1.05 + 100.00);%>
    </div>
  </div>
  	<%if(HomeServlet.chosenProds.size() != 0){  %>
    	<form id="formTransactions" action="RedirectToTransactionPage.jsp" method="get"></form> 
    <%}else{ %>         
        <form id="formTransactions" action="#popup1" method="get"></form> 
    <%} %>
	<button name="buttonTransactions" class="checkout" form="formTransactions" style="font-size: 20px">
		Checkout
	</button>
</div>
       <hr>    
   
    <section id="feature" class="feature">
			<div class="container">
				<div class="section-header">
					<h2>featured products</h2>
				</div><!--/.section-header-->
				<div class="feature-content">
					<div class="row">
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product17" form="formCart">										
										<img src="<%=pdb.getProdImage1("product17")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product17" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product17") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product17") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product17") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product17") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product17") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product17" form="formCart" >
								<h4><%=pdb.getProdName("product17").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product17")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product18" form="formCart">										
										<img src="<%=pdb.getProdImage1("product18")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product18" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product18") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product18") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product18") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product18") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product18") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product18" form="formCart" >
								<h4><%=pdb.getProdName("product18").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product18")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product19" form="formCart">										
										<img src="<%=pdb.getProdImage1("product19")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product19" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product19") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product19") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product19") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product19") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product19") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product19" form="formCart" >
								<h4><%=pdb.getProdName("product19").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product19")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product20" form="formCart">										
										<img src="<%=pdb.getProdImage1("product20")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product20" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product20") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product20") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product20") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product20") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product20") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product20" form="formCart" >
								<h4><%=pdb.getProdName("product20").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product20")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product21" form="formCart">										
										<img src="<%=pdb.getProdImage1("product21")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product21" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product21") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product21") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product21") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product21") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product21") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product21" form="formCart" >
								<h4><%=pdb.getProdName("product21").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product21")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product22" form="formCart">										
										<img src="<%=pdb.getProdImage1("product22")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product22" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product22") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product22") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product22") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product22") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product22") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product22" form="formCart" >
								<h4><%=pdb.getProdName("product22").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product22")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product23" form="formCart">										
										<img src="<%=pdb.getProdImage1("product23")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product23" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product23") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product23") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product23") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product23") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product23") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product23" form="formCart" >
								<h4><%=pdb.getProdName("product23").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product23")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product24" form="formCart">										
										<img src="<%=pdb.getProdImage1("product24")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product24" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product24") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product24") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product24") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product24") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product24") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product24" form="formCart" >
								<h4><%=pdb.getProdName("product24").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product24")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product25" form="formCart">										
										<img src="<%=pdb.getProdImage1("product25")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product25" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product25") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product25") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product25") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product25") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product25") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product25" form="formCart" >
								<h4><%=pdb.getProdName("product25").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product25")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product26" form="formCart">										
										<img src="<%=pdb.getProdImage1("product26")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product26" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product26") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product26") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product26") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product26") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product26") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product26" form="formCart" >
								<h4><%=pdb.getProdName("product26").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product26")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product27" form="formCart">										
										<img src="<%=pdb.getProdImage1("product27")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product27" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product27") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product27") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product27") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product27") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product27") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product27" form="formCart" >
								<h4><%=pdb.getProdName("product27").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product27")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product28" form="formCart">										
										<img src="<%=pdb.getProdImage1("product28")%>" alt="new-arrivals images" style="border-radius: 10%;">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product28" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product28") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product28") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product28") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product28") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product28") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product28" form="formCart" >
								<h4><%=pdb.getProdName("product28").substring(0,20) + "..."%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product28")%></p>
							</div>
						</div>
					</div>
				</div>
			</div><!--/.container-->

		</section><!--/.feature-->
		<!--feature end -->

		<!--blog start -->
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
										<li><p style="font-weight : normal">chairs</p></li><!--/li-->
										<li><p style="font-weight : normal">sofas</p></li><!--/li-->
										<li><p style="font-weight : normal">tables</p></li><!--/li-->
										<li><p style="font-weight : normal">shelves</p></li><!--/li-->
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
									<p style="font-size: 100%; font-weight: normal">How did you feel about your time whilst going through the website!</p>
								      </div>
								
								<div class="hm-foot-para">
									<p style="font-size: 100%; font-weight: normal">  
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
				<div class="content"><p style="font-weight: normal">
					Please add some items to the cart before checking out!
					</p>
						<br><br>
					<button class="btn-cart" style="margin-left: 40%">
					<a href="home.jsp" title="Sign in!"><p style="font-size: 15px; color: white">Ok</p></a>
					</button>
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

			<div id="scroll-Top">
				<div class="return-to-top">
					<i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
				</div>
				
			</div><!--/.scroll-Top-->
			
        </footer><!--/.footer-->
        
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
<script>/* Set rates + misc */
var taxRate = 0.05;
var shippingRate = 15.00; 
var fadeTime = 300;


/* Assign actions */
$('.product-quantity input').change( function() {
  updateQuantity(this);
});

$('.product-removal button').click( function() {
  removeItem(this);
});


/* Recalculate cart */
function recalculateCart()
{
  var subtotal = 0;
  
  /* Sum up row totals */
  $('.product').each(function () {
    subtotal += parseFloat($(this).children('.product-line-price').text());
  });
  
  /* Calculate totals */
  var tax = subtotal * taxRate;
  var shipping = (subtotal > 0 ? shippingRate : 0);
  var total = subtotal + tax + shipping;
  
  /* Update totals display */
  $('.totals-value').fadeOut(fadeTime, function() {
    $('#cart-subtotal').html(subtotal.toFixed(2));
    $('#cart-tax').html(tax.toFixed(2));
    $('#cart-shipping').html(shipping.toFixed(2));
    $('#cart-total').html(total.toFixed(2));
    if(total == 0){
      $('.checkout').fadeOut(fadeTime);
    }else{
      $('.checkout').fadeIn(fadeTime);
    }
    $('.totals-value').fadeIn(fadeTime);
  });
}


/* Update quantity */
function updateQuantity(quantityInput)
{
  /* Calculate line price */
  var productRow = $(quantityInput).parent().parent();
  var price = parseFloat(productRow.children('.product-price').text());
  var quantity = $(quantityInput).val();
  var linePrice = price * quantity;
  
  /* Update line price display and recalc cart totals */
  productRow.children('.product-line-price').each(function () {
    $(this).fadeOut(fadeTime, function() {
      $(this).text(linePrice.toFixed(2));
      recalculateCart();
      $(this).fadeIn(fadeTime);
    });
  });  
}


/* Remove item from cart */
function removeItem(removeButton)
{
  /* Remove row from DOM and recalc cart total */
  var productRow = $(removeButton).parent().parent();
  productRow.slideUp(fadeTime, function() {
    productRow.remove();
    recalculateCart();
  });
}</script>
</body>

</html>