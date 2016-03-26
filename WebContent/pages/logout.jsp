<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<head>
<!-- <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1"> -->
</head>
----//body tags
<%
HttpSession newsession = request.getSession(false);
if(newsession!=null)
{
session.invalidate();
}
response.sendRedirect("login.jsp");
/* session.invalidate();
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", 0); */
%>
