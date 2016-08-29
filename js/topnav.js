/*
	Top navigation menu
		Taken from http://www.w3schools.com/howto/howto_js_topnav.asp

	TODO: Merge into header template as soon as there is one, as having an additional JS file to load is stupidly slow.
*/


/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
