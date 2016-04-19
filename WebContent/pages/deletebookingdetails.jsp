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

String id=request.getParameter("id");
 InitialContext ic = new InitialContext();
Context initialContext = (Context) ic.lookup("java:comp/env");
DataSource datasource = (DataSource) initialContext.lookup("jdbc/MySQLDS");
//result = datasource.getConnection();
Connection con=datasource.getConnection(); 
/*Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");*/

PreparedStatement ps=con.prepareStatement("delete from slotinfo where id=?");

ps.setString(1,id);

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