<%
String uname=(String)session.getAttribute("username");
String cat=(String)session.getAttribute("category");
if(uname==null)
{
%>
<div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">Main</li>
                        <li><a class="ajax-link" href="index.jsp"><i class="glyphicon glyphicon-home"></i><span> Dashboard</span></a>
                        </li>
                        
                        <li><a class="ajax-link" href="login.jsp"><i
                                    class="glyphicon glyphicon-edit"></i><span>Teachers login</span></a></li>
                        <li><a class="ajax-link" href="login.jsp"><i
                                    class="glyphicon glyphicon-edit"></i><span> Students login</span></a></li>
                        
                       </ul>
                    
                </div>
            </div>
        </div>
<%
}
else
{
	if(cat.equals("Teacher"))
	{
%>

<div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">Main</li>
                        <li><a class="ajax-link" href="index.jsp"><i class="glyphicon glyphicon-home"></i><span> Dashboard</span></a>
                        </li>
                        
                        <li><a class="ajax-link" href="makequiz.jsp"><i
                                    class="glyphicon glyphicon-edit"></i><span> Make Test</span></a></li>
                        <li><a class="ajax-link" href="updateTest.jsp"><i
                        class="glyphicon glyphicon-edit"></i><span> Update Test</span></a></li>
                        
                        <li><a class="ajax-link" href="bookslot.jsp"><i
                        class="glyphicon glyphicon-edit"></i><span> Book Slot</span></a></li>
                        <li><a class="ajax-link" href="getOtp.jsp"><i
                                    class="glyphicon glyphicon-edit"></i><span>Update Slot </span></a></li>
                       </ul>
                    
                </div>
            </div>
        </div>
        
<% }else
{%>
<div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">Main</li>
                        <li><a class="ajax-link" href="#"><i class="glyphicon glyphicon-home"></i><span> Dashboard</span></a>
                        </li>
                        
                        
                        <li><a class="ajax-link" href="index.jsp"><i
                                    class="glyphicon glyphicon-edit"></i><span> Take Test</span></a></li>
                        <li><a class="ajax-link" href="bookslot.jsp"><i
                        class="glyphicon glyphicon-edit"></i><span> Book Slot</span></a></li>
                       </ul>
                    
                </div>
            </div>
        </div>

<%}}%>