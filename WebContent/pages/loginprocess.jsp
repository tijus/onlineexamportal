<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@page import="java.sql.*"%>
<%@ page import='javax.sql.*' %>
<%@ page import='javax.naming.*' %>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>

<%
String username=request.getParameter("username");
String userpass=request.getParameter("userpass");
String category=request.getParameter("category");
boolean status=false;
try{
	if(username.equals("") && userpass.equals("") && category.equals(""))
	{
	//	out.println("<font size='2' color='red'>Please fill in your username and password</font>");
		response.sendRedirect("login.jsp?error=Please fill in your username and password");
	}
	else if(username.equals("") || userpass.equals("") || category.equals(""))
	{
		response.sendRedirect("login.jsp?error=Username or Password or category is empty");
	}
	else
	{
		
		InitialContext ic = new InitialContext();
	    Context initialContext = (Context) ic.lookup("java:comp/env");
	    DataSource datasource = (DataSource) initialContext.lookup("jdbc/MySQLDS");
	    //result = datasource.getConnection();
		Connection con=datasource.getConnection();
		/*Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");*/

System.out.print("connected");

PreparedStatement ps=con.prepareStatement("select * from quizregister where username=? and userpass=? ");
ps.setString(1,username);
ps.setString(2,userpass);
ResultSet rs=ps.executeQuery();
status=rs.next();
if(status){

username=rs.getString(2);
session.setAttribute("username",username);
//session.setAttribute("islogin","plz sign in first");
session.setAttribute("category",category);


%>
<jsp:forward page="index.jsp"></jsp:forward>


<%

}
else
{
	response.sendRedirect("login.jsp?error=Please check your username or password");
}
}
}

catch(Exception e){
e.printStackTrace();
}

%>


