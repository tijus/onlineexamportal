<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ include file="counter.jsp" %>
<%@page import="java.io.*"%>




<%
 try {

	 Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");
//String quizid= request.getParameter("qid");
//System.out.println("-------->"+quizid);
String quizname=(String)session.getAttribute("quizname1");
String sub=(String)session.getAttribute("subject");
String question= request.getParameter("question");
String option1= request.getParameter("option1");
String option2= request.getParameter("option2");
String option3= request.getParameter("option3");
String option4= request.getParameter("option4");
String answer=request.getParameter("answer");
String description=request.getParameter("description");

System.out.print("---------------->"+quizname);

PreparedStatement ps=con.prepareStatement("insert into quizques values(?,?,?,?,?,?,?,?,?,?)");

ps.setInt(1,pageCount);
ps.setString(2,sub);
ps.setString(3,quizname);
ps.setString(4,question);
ps.setString(5,option1);
ps.setString(6,option2);
ps.setString(7,option3);
ps.setString(8,option4);
ps.setString(9,answer);
ps.setString(10,description);

int s= ps.executeUpdate();
int counts=pageCount;
if(pageCount<=9)
	{
	response.sendRedirect("createquiz1.jsp?id="+pageCount+"&quizname="+quizname+"&sub="+sub);
 }
else{
	
	response.sendRedirect("status.jsp");
}
}
catch(Exception e){e.printStackTrace();}

%>

