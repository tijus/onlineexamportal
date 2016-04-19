<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
<%
String uname=(String)session.getAttribute("username");
String cat=(String)session.getAttribute("category");
%>
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
        
        
        <jsp:include page="sidebar.jsp"></jsp:include>
        

        
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
<%


if(uname==null)
{
%>
<div class="row">
    <div class="box col-md-9">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i> Introduction</h2>

                
            </div>
            <div class="box-content row">
                <div class="col-lg-12">
                    <div class="header"><h1>Welcome to examination center</h1> <hr></div><br>
                    
                    <div class="contents">
                     <p>Now Teacher and Student can work together
 online.Tutors are most welcomed to my site 
 they can create Questions simply by clicking Make
 Questions link.And Students can appear in questions based on various subject. </p>

 Take a while..
                    
                       </div>
 </div>
 </div></div></div>
<div class="row">
    <div class="box col-md-3">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i> Notifications</h2>

                
            </div>
            <div class="box-content row">
                
                    
                    <div class="contents" style="margin-left:20%;">
                    <marquee direction="up" scrollamount="3">
	                    
	                    Notification 1<br><br>
	                    Notification 1<br><br>
	                    Notification 1<br><br>
	                    Notification 1<br><br>
	                    Notification 1<br><br>
	                    Notification 1<br><br>
	                    Notification 1<br><br>
	                    Notification 1<br><br>
	                    
                    </marquee>
                    	                       </div>
 </div>
 </div>

        </div>
    </div>
</div>
  
<%}
else
{%>
<div class="row">
    <div class="box col-md-12">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i> Introduction</h2>

                
            </div>
            <div class="box-content row">
                <div class="col-lg-12">
                    <div class="header"><h1>Welcome to examination center</h1> <hr></div><br>
                    
                    <div class="contents">
                       <p>Now Teacher and Student can work together
 online.Tutors are most welcomed to my site 
 they can create Questions simply by clicking Make
 Questions link.And Students can appear in questions based on various subject. </p>

<b>Please follow the following exam instructions</b>
<ul>
<li>The exam will have 10 questions</li>
<li>Answering each question is compulsory.</li>
<li>Each question must be answered before 60sec.(1min)</li>
<li>Please call the invigilator for any queries</li>
</ul>

 Take a while..
 </div>
 <form class="form-horizontal" method="get" name="myform" action="takequiz.jsp">
 <div class="checkbox" align="center">  
					<input type="checkbox" name="score" value="0"/>I agree with terms and condition</div>
 <div align="center">
 <button class="btn btn-lg btn-default" type="submit">Proceed for test</button></div></form></div>
 </div>
        </div>
    </div>
</div>
 
<%} %>                
                
            


    <!-- Ad ends -->

    <hr>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">Ã</button>
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
        <p class="col-md-9 col-sm-9 col-xs-12 copyright">&copy; <a href="http://usman.it" target="_blank">Impetus Consultrainers</a> 2012 - 2015</p>

        <p class="col-md-3 col-sm-3 col-xs-12 powered-by">Powered by: <a
                href="http://usman.it/free-responsive-admin-template">Impetus</a></p>
    </footer>
</div>
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
