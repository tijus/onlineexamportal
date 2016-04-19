<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@ page import='javax.sql.*' %>
<%@ page import='javax.naming.*' %>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%try{


InitialContext ic = new InitialContext();
Context initialContext = (Context) ic.lookup("java:comp/env");
DataSource datasource = (DataSource) initialContext.lookup("jdbc/MySQLDS");
//result = datasource.getConnection();
Connection con=datasource.getConnection(); 
/* Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");*/
String id=(String)session.getAttribute("request_id");
out.println(id);
String sub=request.getParameter("sub");
String quizname=request.getParameter("quizname");
String date=request.getParameter("date");
String timeslot=request.getParameter("timeslot");

PreparedStatement ps=con.prepareStatement("Update slotinfo set Subject=?, Quizname=?, Dates=?, Timeslot=? where id=?");
out.println(ps);
ps.setString(1,sub);
ps.setString(2,quizname);
ps.setString(3,date);
ps.setString(4,timeslot);
ps.setString(5,id);

int s=ps.executeUpdate();
if(s==1)
{
response.sendRedirect("getOtp.jsp");
}
else
{
out.println("some error occured while deleting the record.. Contact administration");	
}

}catch(SQLException e2){
e2.printStackTrace();
}
%>
</body>
</html>