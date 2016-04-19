<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@page import="java.sql.*"%>
<%@ page import='javax.sql.*' %>
<%@ page import='javax.naming.*' %>
<%@page import="java.io.*"%>
<%try{

String username=request.getParameter("username");
String userpass=request.getParameter("userpass");
String category=request.getParameter("category");
String email=request.getParameter("email");
InitialContext ic = new InitialContext();
Context initialContext = (Context) ic.lookup("java:comp/env");
DataSource datasource = (DataSource) initialContext.lookup("jdbc/MySQLDS");
//result = datasource.getConnection();
Connection con=datasource.getConnection();
/*Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root",""); */

PreparedStatement ps=con.prepareStatement("insert into quizregister(USERNAME, USERPASS, CATEGORY, EMAIL) values(?,?,?,?)");

ps.setString(1,username);
ps.setString(2,userpass);
ps.setString(3,category);
ps.setString(4,email);
int s=ps.executeUpdate();
System.out.print(s);
}catch(SQLException e2){
e2.printStackTrace();
}
%>
<jsp:forward page="login.jsp"></jsp:forward>
