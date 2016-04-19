<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*"%>
<%@ page import='javax.sql.*' %>
<%@ page import='javax.naming.*' %>
<%@page import="java.io.*"%>
<%@page import="java.util.UUID"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
 InitialContext ic = new InitialContext();
Context initialContext = (Context) ic.lookup("java:comp/env");
DataSource datasource = (DataSource) initialContext.lookup("jdbc/MySQLDS");
//result = datasource.getConnection();
Connection con=datasource.getConnection(); 
/*Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");*/

String name=request.getParameter("name");
String stu_id=request.getParameter("stu_id");
String sub=request.getParameter("sub");
String quizname=request.getParameter("quizname");
String date=request.getParameter("date");
String timeslot=request.getParameter("timeslot");
String otp = UUID.randomUUID().toString().substring(0, 7);

PreparedStatement ps=con.prepareStatement("insert into slotinfo(Name, StuId, Subject, Quizname, Dates, Timeslot, OTP) values(?,?,?,?,?,?,?)");

ps.setString(1, name);
ps.setString(2, stu_id);
ps.setString(3, sub);
ps.setString(4, quizname);
ps.setString(5, date);
ps.setString(6, timeslot);
ps.setString(7, otp);
int s=ps.executeUpdate();
System.out.print(s);
}catch(SQLException e2){
e2.printStackTrace();
}
response.sendRedirect("getOtp.jsp");
%>

</body>
</html>