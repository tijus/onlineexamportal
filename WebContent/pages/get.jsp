<%@page import="java.sql.*"%>
<%@ page import='javax.sql.*' %>
<%@ page import='javax.naming.*' %>
<%@ page import="java.io.*" %>
<%--<%@page import="com.sun.org.apache.bcel.internal.generic.Select"--%>
<%@ include file="counterexam.jsp" %>
<%-- <%@ include file="timer.jsp" %> --%> 
<jsp:include page="header.jsp"></jsp:include>
<link href='css/jquery.noty.css' rel='stylesheet'>
<link href='css/noty_theme_default.css' rel='stylesheet'>
            <ul class="collapse navbar-collapse nav navbar-nav top-menu">
                <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Visit Site</a></li>
                            </ul>

        </div>
    </div>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->

                <!--/span-->
        <!-- left menu ends -->

        <noscript>
            <div class="alert alert-block col-md-12">
                <h4 class="alert-heading">Warning!</h4>

                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a>
                    enabled to use this site.</p>
            </div>
        </noscript>

        <div class="row"">
    <div class="box col-md-10" style="margin-left:10%">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i>Good luck for your exam</h2>
            </div>
            <div class="box-content row">
                <div class="col-lg-12">
                    <div class="header"> <hr></div><br>
                    
                    <div class="contents">
                		 <%
                		 String count=request.getParameter("id");
                		 String subject=request.getParameter("sub");
                		 String name=request.getParameter("quizname");
                		 int counter=Integer.parseInt(count); 
                		 //out.println(counter);
                		 String scoreparam=(String)session.getAttribute("scoreres");
                		 int scoreconvert=Integer.parseInt(scoreparam); 
                		 session.setAttribute("countervariable", counter);
                		 session.setAttribute("subject", subject);
                		 session.setAttribute("name", name);
                		 session.setAttribute("scorekey",scoreconvert);
                		 %>  
                		<form method="get" action="get1.jsp">
					<table>
			
<%
String uname=(String)session.getAttribute("username");
String cat=(String)session.getAttribute("category");
if(uname==null || cat == null){
	out.print("<font size='2' color='red' m>Please do Login First</font>");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}else{
//System.out.println(name);
try{
	
	InitialContext ic = new InitialContext();
    Context initialContext = (Context) ic.lookup("java:comp/env");
    DataSource datasource = (DataSource) initialContext.lookup("jdbc/MySQLDS");
    //result = datasource.getConnection();
	Connection con=datasource.getConnection();
	/*Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");*/


PreparedStatement ps1= con.prepareStatement("select * from quizques where quesno=? and Subject = ? and Quizname = ?" );
ps1.setInt(1,counter);
ps1.setString(2,subject);
ps1.setString(3,name);

ResultSet rs=ps1.executeQuery();
if(rs.next()){
	Integer quesno=rs.getInt(1);
	String question=rs.getString(4);	
	String option1=rs.getString(5);
	String option2=rs.getString(6);
	String option3=rs.getString(7);
	String option4=rs.getString(8);
	String ans=rs.getString(9);
	
	session.setAttribute("anskey", ans);
	%>
	           
	
					<jsp:include page="timer.jsp"></jsp:include>
					<tr><td><h4 style="color:black"><% out.println(quesno+". ");%><%= question%></h4> </td></tr>
					<tr><td><div class="radio"><label><input type="radio" name="radio" value="<%=option1%>"><%=option1%></label></div></td></tr>	
					<tr><td><div class="radio"><label><input type="radio" name="radio" value="<%=option2%>"><%=option2%></label></div></td></tr>
					<tr><td><div class="radio"><label><input type="radio" name="radio" value="<%=option3%>"><%=option3%></label></div></td></tr>
					<tr><td><div class="radio"><label><input type="radio" name="radio" value="<%=option4%>"><%=option4%></label></div></td></tr>
                    
                    <tr><td></td><td><input class="btn btn-default" type="submit" value="Next"/></td><td><a href="index.jsp"><h4>End Test</h4></a></td></tr>

                    	
<%
}
else{%>
<jsp:include page="redirect.jsp"></jsp:include>
<%

	
	out.println("<h3 style='color:red'>Congratulations for completing the test. Your score is "+scoreparam+"</h3>");
	out.println("<h3 style='color:red'><a href='index.jsp'>Go to home page</a> </h3>");
}
}
catch(Exception e){
	e.printStackTrace();
}
}
%>
</table>
                     </form>                     
 </div>
 
                </div>          
            </div>
        </div>
    </div>
</div>



    <!-- Ad ends -->

    <hr>

 <jsp:include page="footer.jsp"></jsp:include>
</div><!--/.fluid-container-->

<!-- external javascript -->

<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='bower_components/moment/min/moment.min.js'></script>
<script src='bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='js/jquery.dataTables.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="bower_components/chosen/chosen.jquery.min.js"></script>
<!-- plugin for gallery image view -->
<script src="bower_components/colorbox/jquery.colorbox-min.js"></script>
<!-- notification plugin -->
<script src="js/jquery.noty.js"></script>
<!-- library for making tables responsive -->
<script src="bower_components/responsive-tables/responsive-tables.js"></script>
<!-- tour plugin -->
<script src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<!-- star rating plugin -->
<script src="js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="js/charisma.js"></script>


</body>
</html>

 



 		              		 
                		 

