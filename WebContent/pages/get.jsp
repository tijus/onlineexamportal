<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%--<%@page import="com.sun.org.apache.bcel.internal.generic.Select"--%>
<%@ include file="counterexam.jsp" %>
<%-- <%@ include file="timer.jsp" %> --%> 
<jsp:include page="header.jsp"></jsp:include>
<link href='css/jquery.noty.css' rel='stylesheet'>
<link href='css/noty_theme_default.css' rel='stylesheet'>
            <ul class="collapse navbar-collapse nav navbar-nav top-menu">
                <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Visit Site</a></li>
                <!-- <li class="dropdown">
                    <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i> Actions <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Make quiz</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Take quiz</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Book slot</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li> -->
                <!-- <li>
                    <form class="navbar-search pull-left">
                        <input placeholder="Search" class="search-query form-control col-md-10" name="query"
                               type="text">
                    </form>
                </li> -->
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
                <h2><i class="glyphicon glyphicon-info-sign"></i> Introduction</h2>

                <!-- <div class="box-icon">
                    <a href="#" class="btn btn-setting btn-round btn-default"><i
                            class="glyphicon glyphicon-cog"></i></a>
                    <a href="#" class="btn btn-minimize btn-round btn-default"><i
                            class="glyphicon glyphicon-chevron-up"></i></a>
                    <a href="#" class="btn btn-close btn-round btn-default"><i
                            class="glyphicon glyphicon-remove"></i></a>
                </div> -->
            </div>
            <div class="box-content row">
                <div class="col-lg-12">
                    <div class="header"><h1><%=request.getParameter("sub") %>:<%=request.getParameter("quizname") %></h1> <hr></div><br>
                    <jsp:include page="timer.jsp"></jsp:include>
                    <div class="contents">
                		 <%
                		 String count=request.getParameter("id");
                		 String subject=request.getParameter("sub");
                		 String name=request.getParameter("quizname");
                		 int counter=Integer.parseInt(count); 
                		 //out.println(counter);
                		 String scoreparam=request.getParameter("score");
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
	Class.forName("com.mysql.jdbc.Driver");

	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");

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
	           
	
			
					<tr><td><h4 style="color:black"><% out.println(quesno+". ");%><%= question%></h4> </td></tr>
					<tr><td><div class="radio"><label><input type="radio" name="radio" value="<%=option1%>"><%=option1%></label></div></td></tr>	
					<tr><td><div class="radio"><label><input type="radio" name="radio" value="<%=option2%>"><%=option2%></label></div></td></tr>
					<tr><td><div class="radio"><label><input type="radio" name="radio" value="<%=option3%>"><%=option3%></label></div></td></tr>
					<tr><td><div class="radio"><label><input type="radio" name="radio" value="<%=option4%>"><%=option4%></label></div></td></tr>
                    
                    <tr><td></td><td><input class="btn btn-default" type="submit" value="Next"/></td></tr>

                    	
<%
}
else
{
	out.println("<h3 style='color:red'>Congratulations for completing the test. Your score is "+scoreparam+"</h3>");
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
                <!-- Ads, you can remove these -->
                <!-- <div class="col-lg-5 col-md-12 hidden-xs center-text">
                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    Charisma Demo 4
                    <ins class="adsbygoogle"
                         style="display:inline-block;width:336px;height:280px"
                         data-ad-client="ca-pub-5108790028230107"
                         data-ad-slot="9467443105"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>
                </div>

                <div class="col-lg-5 col-md-12 visible-xs center-text">
                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    Charisma Demo 5
                    <ins class="adsbygoogle"
                         style="display:inline-block;width:250px;height:250px"
                         data-ad-client="ca-pub-5108790028230107"
                         data-ad-slot="8957582309"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>
                </div>
 -->                <!-- Ads end -->

            </div>
        </div>
    </div>
</div>



    <!-- Ad ends -->

    <hr>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Settings</h3>
                </div>
                <div class="modal-body">
                    <p>Here settings can be configured...</p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a>
                </div>
            </div>
        </div>
    </div>

    <footer class="row">
        <p class="col-md-9 col-sm-9 col-xs-12 copyright">&copy; <a href="http://usman.it" target="_blank">Muhammad
                Usman</a> 2012 - 2015</p>

        <p class="col-md-3 col-sm-3 col-xs-12 powered-by">Powered by: <a
                href="http://usman.it/free-responsive-admin-template">Charisma</a></p>
    </footer>

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

 



 		              		 
                		 

