<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import='javax.sql.*' %>
<%@ page import='javax.naming.*' %>
<%@page import="java.io.*"%>
<jsp:include page="header.jsp"></jsp:include>
            <ul class="collapse navbar-collapse nav navbar-nav top-menu">
                <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Visit Site</a></li>
                
                <link rel="stylesheet" href="datepicker/css/datepicker.css" />
                <script src="datepicker/js/bootstrap-datepicker.js"></script>
            </ul>

        </div>
    </div>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->
        <jsp:include page="sidebar.jsp"></jsp:include>
                <!--/span-->
        <!-- left menu ends -->

        <noscript>
            <div class="alert alert-block col-md-12">
                <h4 class="alert-heading">Warning!</h4>

                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a>
                    enabled to use this site.</p>
            </div>
        </noscript>

        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
    <ul class="breadcrumb">
        <li>
            <a href="#">Home</a>
        </li>
        <li>
            <a href="#">Dashboard</a>
        </li>
    </ul>
</div>
<div class=" row">
    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="6 new members." class="well top-block" href="#">
            <i class="glyphicon glyphicon-user blue"></i>

            <div>Total Students Enrolled</div>
            <div>507</div>
            <span class="notification">6</span>
        </a>
    </div>

    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="4 new pro members." class="well top-block" href="#">
            <i class="glyphicon glyphicon-star green"></i>

            <div>Total Teachers Enrolled</div>
            <div>228</div>
            <span class="notification green">4</span>
        </a>
    </div>

    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="$34 new sales." class="well top-block" href="#">
            <i class="glyphicon glyphicon-pencil yellow"></i>

            <div>Total Students Taking Test</div>
            <div>75</div>
            
        </a>
    </div>

    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="12 new messages." class="well top-block" href="#">
            <i class="glyphicon glyphicon-envelope red"></i>

            <div>Notifications</div>
            <div>25</div>
            <span class="notification red">12</span>
        </a>
    </div>
</div>

<div class="row">
    <div class="box col-md-12">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i> Introduction</h2>

                
            </div>
            <div class="box-content row">
                <div class="col-lg-12">
                    <div class="header"><h1>View / Edit Exam Slot</h1> <hr></div><br>
                    
                    <div class="contents" style="padding:0 5% 5% 5%;">
                    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2><i class="glyphicon glyphicon-edit"></i> Edit Slot</h2>

        
    </div>
    <div class="box-content">
    
    <table class="table table-striped table-bordered bootstrap-datatable datatable responsive">
    <thead>
    <tr>
        <th>Name of examinee</th>
        <th>Exam Id</th>
        <th>Subject</th>
        <th>Exam title</th>
        <th>Date of Exam</th>
        <th>Time Slot</th>
        <th>OTP Generated</th>
        
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
     InitialContext ic = new InitialContext();
Context initialContext = (Context) ic.lookup("java:comp/env");
DataSource datasource = (DataSource) initialContext.lookup("jdbc/MySQLDS");
//result = datasource.getConnection();
Connection con=datasource.getConnection(); 
    /*Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");*/


PreparedStatement ps1= con.prepareStatement("select * from slotinfo" );


ResultSet rs=ps1.executeQuery();
while(rs.next()){

	String id=rs.getString(1);
	String name=rs.getString(2);	
	String stu_id=rs.getString(3);
	String subj=rs.getString(4);
	String quizname=rs.getString(5);
	String dates=rs.getString(6);
	String timeslot=rs.getString(7);
	String otp=rs.getString(8);
	
	
	%>
    <tr>
        <td class="center"><%=name %></td>
        <td class="center"><%=stu_id %></td>
        <td class="center"><%=subj %></td>
        <td class="center"><%=quizname %></td>
        <td class="center"><%=dates %></td>
        <td class="center"><%=timeslot %></td>
        <td class="center"><%=otp %></td>
        <!--
        for finding status
         <td class="center">
            <span class="label-success label label-default">Active</span>
        </td> -->
        <td class="center">
            
            <a class="btn btn-info" href="update.jsp?id=<%=id %>">
                <i class="glyphicon glyphicon-edit icon-white"></i>
                Edit
            </a>
            <a class="btn btn-danger" href="deletebookingdetails.jsp?id=<%=id%>">
                <i class="glyphicon glyphicon-trash icon-white"></i>
                Delete
            </a>
        </td>
    </tr>
   
    <%
}%>
    </tbody>
    </table>
    </div>
    </div>
             
						
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

    <jsp:include page="footer.jsp"></jsp:include>
</div><!--/.fluid-container-->

<!-- external javascript -->

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
