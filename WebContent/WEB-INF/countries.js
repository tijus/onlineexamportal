
var country_arr = new Array("InterScore", "IntraScore", "Surge");

// States
var s_a = new Array();
s_a[0]="Select Event";
s_a[1]="Open Football|Volleyball|Rink Football|Chess|Carrom(Singles)|Carrom(Doubles)|Badminton Boys(Single)|Badminton Boys(Double)|Badminton Girls(Single)";
s_a[2]="Open Cricket|Open Football|Rink Football|Box Cricket|Mixed Box Criket(4 Boys & 2 Girls min.)|Badminiton Boys & Girls(Singles)|Badminton Boys & Girls(Doubles)|Table Tennis(Singles)|Table Tennis(Doubles)|Lawn Tennis|Chess|Carrom Boys & Girls(Singles)|Carrom Boys & Girls(Singles)|Carrom Boys & Girls(Doubles)|Volleyball(Mix)|Throw Ball(Girls)|Dodge Ball(Girls)";
s_a[3]="Art and Culture|Street Play|Alankar(InterSinging)|Intradance|Fashion Show|Quiz Competition|Debate|Treasure Hunt|Revv it up|Masterchef|Mr. and Ms. Somaiya|Choreo Night(InterDance)|EDM Night|CounterStrike|NFS|FIFA|Human Foot-Ball|Neon Cricket|Angry Birds|Trampoline Jump|Rubik Cube Competition|Mumbais Got Talent";


function populateStates( countryElementId, stateElementId ){

	var selectedCountryIndex = document.getElementById( countryElementId ).selectedIndex;

	var stateElement = document.getElementById( stateElementId );

	stateElement.length=0;	// Fixed by Julian Woods
	stateElement.options[0] = new Option('Select Event','');
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
	countryElement.options[0] = new Option('Select Event Type','-1');
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