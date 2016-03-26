<%@ page language="java" import="java.sql.*, java.io.*, java.util.*" %>


<%



try{
	/* Properties p=new Properties();
	String path= getServletContext().getRealPath("/").replace('\\', '/');
	p.load(new FileInputStream(path+"/pages/jdbc.properties"));
	String driverstr=p.getProperty("driver");
	Class.forName(driverstr);
	String urlstr=p.getProperty("url");
	Connection con=DriverManager.getConnection(urlstr,p); */
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");
	PreparedStatement ps1= con.prepareStatement("select distinct Subject from quizques" );
	StringBuffer values = new StringBuffer();
%> 
<script type="text/javascript">
var country_arr=new Array();
var s_a = new Array();
//s_a[0]="Select Event";

s_a.push("Select");

</script>
<%
ResultSet rs=ps1.executeQuery();
while(rs.next()){
	String sub=rs.getString(1);
%>

<script type="text/javascript">
//var country_arr = new Array("test2", "adv. java");
//document.write(counrtry_arr);

 country_arr.push("<%= sub %>");
// States
</script>
<%
PreparedStatement ps= con.prepareStatement("select distinct Quizname from quizques where Subject=? " );
ps.setString(1,sub);
ResultSet rs1=ps.executeQuery();
while(rs1.next())
{
	String quizname=rs1.getString(1);
	out.println(quizname);


%>
<script type="text/javascript">
s_a.push("<%= quizname %>");
function populateStates( countryElementId, stateElementId ){

	var selectedCountryIndex = document.getElementById( countryElementId ).selectedIndex;

	var stateElement = document.getElementById( stateElementId );

	stateElement.length=0;	// Fixed by Julian Woods
	stateElement.options[0] = new Option('Select','');
	stateElement.selectedIndex = 0;

	var state_arr = s_a[selectedCountryIndex].split("|");

	for (var i=0; i<state_arr.length; i++) {
		stateElement.options[stateElement.length] = new Option(state_arr[i],state_arr[i]);
	}
}

function populateCountries(countryElementId, stateElementId){
	// given the id of the <select> tag as function argument, it inserts <option> tags
	var countryElement = document.getElementById(countryElementId);
	countryElement.length=0;
	countryElement.options[0] = new Option('Select','-1');
	countryElement.selectedIndex = 0;
	for (var i=0; i<country_arr.length; i++) {
		countryElement.options[countryElement.length] = new Option(country_arr[i],country_arr[i]);
	}

	// Assigned all countries. Now assign event listener for the states.

	if( stateElementId ){
		countryElement.onchange = function(){
			populateStates( countryElementId, stateElementId );
		};
	}
}
</script>
<%
}
}
}
catch(Exception e){
	e.printStackTrace();
}
%>