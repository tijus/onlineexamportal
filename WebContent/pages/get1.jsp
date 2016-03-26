<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%

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
response.sendRedirect("get.jsp?sub="+subject+"&quizname="+name+"&score="+score+"&id="+counter);

%>