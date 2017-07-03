<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>




    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0;
        padding: 0;
      }

    </style>
    <script type="text/javascript"
          src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBR48eWLpcfyXoBH5YbJvBRfdvpRfDymxo&libraries=places&sensor=false">
        </script>
    <script>
    
    
    
    <%
    String abc=(String)session.getAttribute("emailid");
    try
    {
    	Class.forName("com.ibm.db2.jcc.DB2Driver");
    	String driver="jdbc:db2://localhost:50000/sample";
    	String url="Abhishek";
    	String pass="microsoft";
    	Connection con=DriverManager.getConnection(driver, url, pass);
    	PreparedStatement ps=con.prepareStatement("select * from places where userid=?");
    	ps.setString(1, abc);//ekkada emaili d ke rayyee
    	ResultSet rs=ps.executeQuery();  
    	  
    	  %>
    
    	  
    
var map;
var infowindow;
function initialize() {
  map = new google.maps.Map(document.getElementById('map-canvas'), {
    zoom: 2,
    center: {lat: -34.397, lng: 150.644}
  });

  //var bounds = new google.maps.LatLngBounds();
  
  var placeid=[];
  <%while(rs.next()){%>
	
    placeid.push('<%=rs.getString("placeid")%>');
<%   
}}
catch(Exception e){e.printStackTrace();}%>



for (var i = 0; i < placeid.length; i++) {
	console.log(placeid[i]);
contents(placeid[i]);
}













}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>



 










<body>


<div id="map-canvas"></div>
<input type=hidden name="emailid" value=<%=abc %> >

<script>

function contents(id)
{
	console.log('hai');
	var request = {
		    placeId:id
		  };

	 infowindow = new google.maps.InfoWindow();
		  var service = new google.maps.places.PlacesService(map);
		  service.getDetails(request, function(place, status) {
			    if (status == google.maps.places.PlacesServiceStatus.OK) {
			    	var marker = new google.maps.Marker({
			            map: map,
			            position: place.geometry.location
			          });
			          google.maps.event.addListener(marker, 'click', function() {
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

			        	 
			        	  
			        	infowindow.setContent(content);
			        	  
			        	  
			        	  
			        	  
			        	  
			        	  
			            
			            infowindow.open(map, this);
			          });

  
  
  

}

});

}




</script>


	





</body>
</html>