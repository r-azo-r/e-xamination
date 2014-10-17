<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.Random,java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%
 session.invalidate();
%>
<title>e-Xamination!</title>
<meta http-equiv="Content-Type" content="text/html" />
<link href="images/styles.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="HEADER">
	<h1>e-Xamination</h1>
    <h4>Exams are not boring anymore!</h4>
	<ul>
		<li><a href="contact.html">Contact Us</a></li>
		<li><a href="about.html">About Us</a></li>
		<li><a href="signup.jsp">Sign Up</a></li>
		<li><a href="sign.html">Sign In</a></li>
		<li><a href="index.jsp">Home</a></li>
	</ul>
	<div class="Visual"> </div>
</div>

<div id="CONTENT">
	<!--<h2>Welcome</h2>-->
    
	<div id="TEXT">
    	<p><h2>Welcome</h2></p>
		<p>The ClassMarker online testing website is a professional, easy to use online   quiz maker that marks your tests and quizzes for you. You simply create your   quizzes and your learners or business clients take them online.</p>
        <hr/>
        <p><h2>Features</h2></p>
        <ul type="">
        <li>
        <h4>Faculty</h4>
        <ul>
        <li>Randomly select quiz questions </li>
        <li>Choose Different Subjects for test</li>
        <li>Create online tests with combined multiple choice, true false, free text, short answer, fill in the blank, punctuation and essay questions types</li>
        <li>Real-time score monitoring</li>
        </ul>
        <br />
        <li>Students</li>
       
        <ul>
        <li>Take Real and Practice tests on different subjects</li>
        <li>Check personal progress:Subject-wise and Semester-wise</li>
  		<li>Post in doubts related to various subjects</li>
        </ul>
        </li>
        </ul>
    </div>
</div>

<div id="FOOTER">
<p><a href="#">FAQ</a> &bull; <a href="#">Terms</a> &bull; <a href="#">About Us</a></p>

</div>

</body>
</html>
