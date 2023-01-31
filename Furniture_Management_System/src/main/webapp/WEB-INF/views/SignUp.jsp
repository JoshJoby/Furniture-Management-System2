<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SignUpPackage.UserServlet" %>
<%		String[] countries = new String[]{"Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", 
		"Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", 
		"Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus",
		"Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", 
		"Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", 
		"Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", 
		"Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", 
		"Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", 
		"Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", 
		"Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", 
		"Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", 
		"French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia",
		"Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala",
		"Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)",
		"Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", 
		"Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", 
		"Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", 
		"Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", 
		"Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", 
		"Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique",
		"Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", 
		"Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", 
		"Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", 
		"Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", 
		"Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", 
		"Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", 
		"Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", 
		"Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", 
		"Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", 
		"Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands",
		"Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", 
		"Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", 
		"Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates",
		"United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", 
		"Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", 
		"Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe", "Palestine"};


request.setAttribute("countries", countries); %>
<!DOCTYPE html>

<html>
        <title>Sign up!</title>

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
  width: 400px;
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

<div style="text-align: center">
	<% if((boolean)request.getAttribute("isPageVisible")){ %>
	<div class="bar error">User Already Exists !</div>
	<%} else %>      <p>&nbsp</p>
</div>
<div class="form_wrapper">
  <div class="form_container"> 
    <div class="title_container">	
      <h2>Sign Up !</h2>
    </div>
    <div class="row clearfix">
      <div class="">
        <form name="addUserDetails" method="post">
          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-envelope"></i></span>
            <input type="email" name="email" placeholder="Email" required />
          </div>
          
          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock"></i></span>
            <input type="password" name="password" placeholder="Password" required />
          </div>
          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock"></i></span>
            <input type="password" name="password" placeholder="Re-type Password" required />
          </div>
          <hr>
              <br>
          <div class="row clearfix">
            <div class="col_half">
              <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="name1" placeholder="First Name" required/>
              </div>
            </div>
            <div class="col_half">
              <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="name2" placeholder="Last Name" required />
              </div>
            </div>
          </div>
          <hr>
              <br>
            	<div class="input_field radio_option" style="margin-left: 22%">
              <input type="radio" name="radiogroup1" id="rd1" value="Male">
              <label for="rd1">Male</label>
              <input type="radio" name="radiogroup1" id="rd2" value="Female">
              <label for="rd2">Female</label>
              <input type="radio" name="radiogroup1" id="rd3" value="Other">
              <label for="rd3">Other</label>
              </div>
              <hr>
              <br>
             <div class="input_field"> <span><i aria-hidden="true" class="fa fa-envelope"></i></span>
            <input type="text" name="phno" height="30px" placeholder="Phone Number"  pattern="\d{10}" title="Error: 10 digits are required." required />
          </div>
               <div class="input_field"> <span><i aria-hidden="true" class="fa fa-envelope"></i></span>
            <input type="text" name="address" height="30px" placeholder="Address" required />
          </div>
              <div class="input_field select_option">
                <select name="country">
                <option>Select a country</option>
               
                <%String countries1[] = (String[])request.getAttribute("countries");
            	  for(String s : countries1){%>
                  <option><%=s %></option>
                  <%} %>
                </select>
                <div class="select_arrow"></div>
              </div>
              <hr>
              <br>
            <div class="input_field checkbox_option">
            	<input type="checkbox" id="cb1" name="cb1">
    			<label for="cb1" required>I agree with terms and conditions</label>
            </div>
            <div class="input_field checkbox_option">
            	<input type="checkbox" id="cb2" name="cb2">
    			<label for="cb2">I want to receive the newsletter</label>
            </div>
          <input class="button" type="submit" value="Register" id="submitBtn"/>
          <div style="text-align: center; margin-top: 5%">
          <a href="SignIn.jsp">Already Registered?</a>
          </div>
           <div style="text-align: center; margin-top: 5%">
          <a href="home.jsp" >Return to home</a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
let checkBox = document.getElementById("cb1");
let button = document.getElementById("submitBtn");
button.disabled = true;
checkBox.addEventListener("change", stateHandle);

function stateHandle() {
    if(document.getElementById("cb1").checked) {
        button.disabled = false;
    } else {
        button.disabled = true;
    }
}
</script>
</html>