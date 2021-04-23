
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ibm.security.appscan.altoromutual.model.Printing"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.lang.reflect.Array"%>
<%@ page import="java.util.List"%>

<%
/**
 This application is for demonstration use only. It contains known application security
vulnerabilities that were created expressly for demonstrating the functionality of
application security testing tools. These vulnerabilities may present risks to the
technical environment in which the application is installed. You must delete and
uninstall this demonstration application upon completion of the demonstration for
which it is intended.

IBM DISCLAIMS ALL LIABILITY OF ANY KIND RESULTING FROM YOUR USE OF THE APPLICATION
OR YOUR FAILURE TO DELETE THE APPLICATION FROM YOUR ENVIRONMENT UPON COMPLETION OF
A DEMONSTRATION. IT IS YOUR RESPONSIBILITY TO DETERMINE IF THE PROGRAM IS APPROPRIATE
OR SAFE FOR YOUR TECHNICAL ENVIRONMENT. NEVER INSTALL THE APPLICATION IN A PRODUCTION
ENVIRONMENT. YOU ACKNOWLEDGE AND ACCEPT ALL RISKS ASSOCIATED WITH THE USE OF THE APPLICATION.

IBM AltoroJ
(c) Copyright IBM Corp. 2008, 2013 All Rights Reserved.
*/
%>

<jsp:include page="header.jspf"/>

<div id="wrapper" style="width: 99%;">
	<jsp:include page="/toc.jspf"/>

   <td valign="top" colspan="3" class="bb">

		<div class="fl" style="width: 99%;">

		<h1>Online Banking Login</h1>
			<title>Google Charts Tutorial</title>
			<script type = "text/javascript" src = "https://www.gstatic.com/charts/loader.js"></script>
			<script type = "text/javascript">
				google.charts.load('current', {packages: ['corechart','line']});
			</script>

			<%
				List<List<Object>> store = new ArrayList();
				Printing p= new Printing();
				store=p.printingresult("SPY",3);

				for (int i=0;i <store.size();i++){
			%>
			<tr><td><%=store.get(i).get(0)%></td><td><%=store.get(i).get(1)
			%></td><td></td></tr>
			<% } %>

			</head>

			<body>
			<div id = "container" style = "width: 550px; height: 400px; margin: 0 auto">
			</div>
			<script language = "JavaScript">
				function drawChart() {
					// Define the chart to be drawn.
					var data = new google.visualization.DataTable();
					data.addColumn('string', 'Months');
					data.addColumn('number', 'SPY');
					data.addColumn('number', 'AAPL');

					data.addRows([
						['Jan',  70.0, 33.9],
						['Feb',  60.9, 43.2],
						['Mar',  90.5,53.7],
						['Apr',  140.5, 83.5],
						['May',  180.2,113.9],
						['Jun',  210.5,153.2],

						['Jul',  250.2,173.0],
						['Aug',  260.5,163.6],
						['Sep',  230.3,143.2],
						['Oct',  180.3,103.3],
						['Nov',  130.9,63.6],
						['Dec',  90.6, 43.8]
					]);

					// Set chart options
					var options = {

						hAxis: {
							title: 'Month',
						},
						vAxis: {
							title: 'Temperature',
						},
						'width':550,
						'height':400
					};

					// Instantiate and draw the chart.
					var chart = new google.charts.Line(document.getElementById('container'));
					chart.draw(data, options);
				}
				google.charts.setOnLoadCallback(drawChart);
			</script>
			</body>
		<!-- To get the latest admin login, please contact SiteOps at 415-555-6159 -->
		<p><span id="_ctl0__ctl0_Content_Main_message" style="color:#FF0066;font-size:12pt;font-weight:bold;">
		<%
		java.lang.String error = (String)request.getSession(true).getAttribute("loginError");

		if (error != null && error.trim().length() > 0){
			request.getSession().removeAttribute("loginError");
			out.print(error);
		}
		%>
		</span></p>

		<form action="doLogin" method="post" name="login" id="login" onsubmit="return (confirminput(login));">
		  <table>
		    <tr>
		      <td>
		        Username:
		      </td>
		      <td>
		        <input type="text" id="uid" name="uid" value="" style="width: 150px;">
		      </td>
		      <td>
		      </td>
		    </tr>
		    <tr>
		      <td>
		        Password:
		      </td>
		      <td>
		        <input type="password" id="passw" name="passw" style="width: 150px;">
		        </td>
		    </tr>
		    <tr>
		        <td></td>
		        <td>
		          <input type="submit" name="btnSubmit" value="Login">
		        </td>
		      </tr>
		  </table>
		</form>

		</div>

		<script type="text/javascript">
			function setfocus() {
			    if (document.login.uid.value=="") {
			      	document.login.uid.focus();
			    } else {
			      	document.login.passw.focus();
			    }
			}

			function confirminput(myform) {
			    if (myform.uid.value.length && myform.passw.value.length) {
			      return (true);
			    } else if (!(myform.uid.value.length)) {
			      myform.reset();
			      myform.uid.focus();
			      alert ("You must enter a valid username");
			      return (false);
			    } else {
			      myform.passw.focus();
			      alert ("You must enter a valid password");
			      return (false);
			    }
			}
			window.onload = setfocus;
		</script>
    </td>
</div>

<jsp:include page="footer.jspf"/>