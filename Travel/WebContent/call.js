var map;
var directionsDisplay;
var directionsService;
var stepDisplay;
var markerArray = [];

function initialize() {
  // Instantiate a directions service.
  directionsService = new google.maps.DirectionsService();

  // Create a map and center it on Manhattan.
  var manhattan = new google.maps.LatLng(40.7711329, -73.9741874);
  var mapOptions = {
    zoom: 13,
    center: manhattan
  };
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  // Create a renderer for directions and bind it to the map.
  var rendererOptions = {
    map: map
  };
  directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
 directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('directionsPanel'));
  // Instantiate an info window to hold step text.
  stepDisplay = new google.maps.InfoWindow();
  
  
 
	var searchField = document.getElementById('start');				
   var searchField1 = document.getElementById('end');
   var searchOptions = {
						bounds: new google.maps.LatLngBounds(
							new google.maps.LatLng(-8.54, 17.33),
							new google.maps.LatLng(39.67, 43.77)
						),
						types: new Array()
					};
   var autocompleteSearch = new google.maps.places.Autocomplete(searchField, searchOptions);
   var autocompleteSearch1 = new google.maps.places.Autocomplete(searchField1, searchOptions);
   
}

function calcRoute() {
for (var i = 0; i < markerArray.length; i++) {
    markerArray[i].setMap(null);
  }

  // Now, clear the array itself.
  markerArray = [];
  
 

  // Retrieve the start and end locations and create
  // a DirectionsRequest using WALKING directions.
  var start = document.getElementById('start').value;
  var end = document.getElementById('end').value;
   var selectedMode = document.getElementById('mode').value;
  var request = {
      origin: start,
      destination: end,
      travelMode: google.maps.TravelMode[selectedMode],
	  provideRouteAlternatives: true
  };

  // Route the directions and pass the response to a
  // function to create markers for each step.
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
     directionsDisplay.setDirections(response);
     showSteps(response,0);
    }
	if (status == google.maps.DirectionsStatus.ERROR) {
	alert('ERROR: There was a problem contacting the Google servers');}
	if (status == google.maps.DirectionsStatus.INVALID_REQUEST) {
	alert('INVALID_REQUEST: This request was invalid');}
	if (status == google.maps.DirectionsStatus.ZERO_RESULTS) {
	alert('ZERO_RESULTS: No result was found for this request');}
	if (status == google.maps.DirectionsStatus.OVER_QUERY_LIMIT) {
	alert('OVER_QUERY_LIMIT: The webpage has gone over its request quota');}
	if (status == google.maps.DirectionsStatus.REQUEST_DENIED) {
	alert('REQUEST_DENIED: The webpage is not allowed to use the PlacesService');}
	if (status == google.maps.DirectionsStatus.UNKNOWN_ERROR) {
	alert('UNKNOWN_ERROR: The PlacesService request could not be processed due to a server error. The request may succeed if you try again');}
  });
}

function showSteps(directionResult,j) {
   // First, remove any existing markers from the map.
  for (var i = 0; i < markerArray.length; i++) {
    markerArray[i].setMap(null);
  }

  // Now, clear the array itself.
  markerArray = [];
  
 var myRoute = directionResult.routes[j].legs[0];

  for (var i = 0; i < myRoute.steps.length; i++) {
    var marker = new google.maps.Marker({
      position: myRoute.steps[i].start_location,
      map: map
    });
    attachInstructionText(marker, myRoute.steps[i].instructions);
    markerArray[i] = marker;
  }
}

function attachInstructionText(marker, text) {
  google.maps.event.addListener(marker, 'click', function() {
    // Open an info window when the marker is clicked on,
    // containing the text of the step.
    stepDisplay.setContent(text);
    stepDisplay.open(map, marker);
  });
}



google.maps.event.addDomListener(window, 'load', initialize);