<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SignUpPackage.SignInServlet" %>

<!DOCTYPE html>

<html>
        <title>Sign in!</title>

        <!-- For favicon png -->
		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
<head>
	<link rel="stylesheet" href="styles.css">
</head>   
 
<style>
body {
  background-image: url('bg1.jpg');
  background-size: cover;
  background-color: rgba(0,0,0,0.6);
  background-blend-mode: multiply;
}
.bar {
  color: #333;
  width: 300px;
  height: 15px;
  text-align: center;
  background: #fafafa;
  border: 1px solid #ccc;
  padding: 25px;
  margin: 2.5% auto 0;
  position: relative;
}

.error {
  color: #ba3939;
  background: #ffe0e0;
  border: 1px solid #a33a3a;
}
</style>
     <p>&nbsp</p>
<div style="text-align: center">
	<% if((boolean)request.getAttribute("isAuth")){ %>
	<div class="bar error">Incorrect Login Credentials !</div>
	<%} else %>      <p>&nbsp</p>
</div>
<div class="form_wrapper">
  <div class="form_container"> 
    <div class="title_container">	
      <h2>Login</h2>
    </div>
    <div class="row clearfix">
      <div class="">
        <form name="AddUserDetails" method="post">
          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-envelope"></i></span>
            <input type="email" name="email" placeholder="Email" required />
          </div>
          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock"></i></span>
            <input type="password" name="password" placeholder="Password" required />
          </div>
          <input class="button" type="submit" value="Log In" id="submitBtn"/>     
          <div style="text-align: center; margin-top: 5%">
          <a href="SignUp.jsp" >Haven't Registered?</a>
          </div>
          <div style="text-align: center; margin-top: 5%">
          <a href="home.jsp" >Return to home</a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</html>