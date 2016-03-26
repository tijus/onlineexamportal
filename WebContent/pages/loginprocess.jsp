<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
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
		out.println("<font size='2' color='red'>Please fill in your username and password</font>");
		response.sendRedirect("login.jsp?error=Please fill in your username and password");
	}
	else if(username.equals("") || userpass.equals("") || category.equals(""))
	{
		response.sendRedirect("login.jsp?error=Username or Password or category is empty");
	}
	else
	{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");
System.out.print("connected");

PreparedStatement ps=con.prepareStatement("select * from quizregister where username=? and userpass=? ");
ps.setString(1,username);
ps.setString(2,userpass);
ResultSet rs=ps.executeQuery();
status=rs.next();
if(status){
System.out.print("hi");
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
out.println("connection error..Contact administrator");
}
}
}

catch(Exception e){
e.printStackTrace();
}

%>


