<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@page import="java.sql.*"%>
<%@ page import='javax.sql.*' %>
<%@ page import='javax.naming.*' %><%

int counter=(Integer)session.getAttribute("countervariable");
String name=(String)session.getAttribute("name");
String subject=(String)session.getAttribute("subject");
String res=(String)session.getAttribute("anskey");
int score=(Integer)session.getAttribute("scorekey");
//String[] ans= new String[10];
String ans=request.getParameter("radio");
counter++;

System.out.println(res);
System.out.println(ans);
if(res.equals(ans))
{
score++;	
}
System.out.println(score);
session.setAttribute("scoreres", score);
response.sendRedirect("get.jsp?sub="+subject+"&quizname="+name+"&id="+counter);

%>