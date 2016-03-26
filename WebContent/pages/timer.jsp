  <script src="jquery.js"></script>
<script type="text/javascript">
function c(){
	var c=61;
	setInterval(function(){
		c--;
		if(c>0){
			 $('#refresh h4').html('Time remaining: '+ c + 's');
		}
		if(c==0)
		{
			window.location="get1.jsp";
		}
	},1000);
}

// Start
c();

// Loop
setInterval(function(){
	c();
},60000);
</script>
<div align="right" style="margin-right:10%" id="refresh"><h4 style="color:red"></h4></div>

<!-- <span class="c" id="5"></span> -->