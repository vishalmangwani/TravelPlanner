function contents(mark,id)
{
var request2 = {
  placeId: id
};
service2 = new google.maps.places.PlacesService(map);
service2.getDetails(request2,function(place, status) {
if (status == google.maps.places.PlacesServiceStatus.OK) {
   var placeLoc = place.geometry.location;
  var marker = mark;
  
  
  
var content;
  var photos = place.photos;
  content='<b><h3>Place:'+place.name+'</h3></b>';
  if (photos) {
 for(n=0;n<photos.length;n++){
  var pho = photos[n].getUrl({'maxWidth':100, 'maxHeight': 100});
  content+= '<div id="info">' + 
 '<img src=\"'+pho+'\"' +' alt=""  height="100"  width="100"  />'+
 '</div>';
}
}
var  formataddress=place.formatted_address;
if(formataddress){
content+='<address>Address:'+formataddress+'</address>';
}
var pnumber=place.formatted_phone_number;
if(pnumber){
content+='<p>PhoneNumber:'+pnumber+'</p>';
}
var Ipnumber=place.international_phone_number;
if(Ipnumber){
content+='<p>International PhoneNumber:'+Ipnumber+'</p>';
}
var glocation=place.geometry.location;
if(glocation){
content+='<p>Geometry Location:'+glocation+'</p>';
}
var pid=place.place_id;
if(pid){
content+='<p>Google place Id:'+pid+'</p>';
}
var rating=place.rating;
if(rating){
content+='<p>ratings:'+rating+'(out of 5) </p>';
}
var website=place.website;
if(website){
content+='<p><a  href=\"'+website+' \" >' +'Website:'+website+'</a></p>';
}

content+=' <button onclick=\'save('+'\"'+place.name+'\"'+','
	+'\"'+pid+'\"'+','
	+'\"'+formataddress+'\"'+')\'>save</button>'; 
  
infowindow.setContent(content);
infowindow.open(map, mark);
}

});

}

