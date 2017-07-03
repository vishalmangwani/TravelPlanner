
var infowindow = new google.maps.InfoWindow();
 var  routeindex;
 
function calcRoute1() {
for (var i = 0; i < markerArray.length; i++) {
    markerArray[i].setMap(null);
  }

  // Now, clear the array itself.
  markerArray = [];
routeindex= Number(document.getElementById('routeno').value);
try{
routeindex=routeindex-1;				
directionsDisplay.setRouteIndex(routeindex);
var directionResult=directionsDisplay.getDirections();
showSteps(directionResult,routeindex);}
catch(err){ alert("Invalid Route");}

 
}


function calcRoute2()
{

directionsDisplay.setRouteIndex(routeindex);
var directionResult=directionsDisplay.getDirections();


var myRoute = directionResult.routes[routeindex].legs[0];
var  p1=document.getElementById('places').value; 
icn(p1);

for (var i = 0; i < markerArray.length; i++) {
    markerArray[i].setMap(null);
  }
  
markerArray = [];
var i=0,m=0;
var myvar;
 myvar=window.setInterval(function(){ 
 
if( i < myRoute.steps.length) {
             if(myRoute.steps[i].distance.value>50000)
                   {
                     path=myRoute.steps[i].path;
 
 
                           if( m < path.length) {

                                var request2 = {
                                  location: path[m],
                                  radius: 50000,
                                types:[p1]
	                                           };

                            console.log(m); 
 
                       var service2 = new google.maps.places.PlacesService(map);
                      service2.nearbySearch(request2, callback);
                       m=m+150;
                                                  }else{m=0,i++;}
                    } 
  else{
  
  console.log('hai');
   var request1 = {
    location: myRoute.steps[i].start_location,
    radius: 50000,
   types:[p1]
	
  };

  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch(request1, callback);
  i++;
  }
}
else
{
clearInterval(myvar);
}

},500);



}
function callback(results, status,pagination) {
  if (status == google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
	  if (pagination.hasNextPage) {
      pagination.nextPage();
    }
    }
  }
}

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker1 = new google.maps.Marker({
    map: map,
	icon:Icon,
    position: place.geometry.location
  });
markerArray.push(marker1);
google.maps.event.addListener(marker1, 'click', function() {
    contents(this,place.place_id);
  });
}
