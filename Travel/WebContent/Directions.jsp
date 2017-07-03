<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Directions service (complex)</title>
    <style>
      html, body, #map-canvas {
        height: 100%;
       
      }
      #panel {
        position: absolute;
        top: 5px;
        left: 20%;
        margin-left: -180px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
	</style> <style>
      #directionsPanel {












width:30%;overflow: scroll;
        height: 100%;
        float: right;
       
       
      }

    /*  #map-canvas {
        margin-right: 400px;
      }

      #panel {
        background: #fff;
        padding: 5px;
        font-size: 14px;
        font-family: Arial;
        border: 1px solid #ccc;
        box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
        
      }

      @media print {
        #map-canvas {
          height: 500px;
          margin: 0;
        }

        #directionsPanel {
          float: none;
          width: auto;
        }
      }*/
    </style>
    <script type="text/javascript"
          src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBR48eWLpcfyXoBH5YbJvBRfdvpRfDymxo&libraries=places&sensor=false">
        </script>
    <script type="text/javascript" src="call.js" >


    </script>
 <script type="text/javascript" src="call3.js" >


    </script>
 <script type="text/javascript" src="call2.js" >


    </script>	
	<script type="text/javascript" src="call4.js" >


    </script>
	<script type="text/javascript" src="exp.js" >


    </script>
	
	
	
  </head>
  <body>
    <div id="panel">
    <b>Start: </b>
   <input type='text' id="start"  required></input>
      
    <b>End: </b>
     <input type='text' id="end" required></input>
	 <b>Mode of Travel: </b>
	  <select id="mode" >
      <option value="DRIVING">Driving</option>
      <option value="WALKING">Walking</option>
      <option value="BICYCLING">Bicycling</option>
      <option value="TRANSIT">Transit</option>
    </select>
    <input type='button'  value='Submit' onclick="calcRoute();"></input>
	<b>Route No: </b>
	<input type='text' id="routeno" size='3' onchange="calcRoute1();" required></input>
	<b>Places of Interest</b>
	  <select id="places" >
	<!--  -->  <option value="Select">Select</option>
      <option value="accounting">accounting</option>
      <option value="airport">airport</option>
      <option value="amusement_park">amusement_park </option>
      <option value="aquarium">aquarium </option>
	  <option value="art_gallery">art_gallery</option>
      <option value="atm">atm </option>
	  <option value="bakery">bakery </option>
      <option value="bank">bank</option>
	  <option value="bar">bar</option>
      <option value="beauty_salon"> beauty_salon</option>
	  <option value="bicycle_store">bicycle_store </option>
      <option value="book_store"> book_store</option>
	  <option value="bowling_alley">bowling_alley </option>
      <option value="bus_station">bus_station </option>
	  <option value="cafe">cafe </option>
      <option value="campground">campground </option>
	  <option value="car_dealer">car_dealer </option>
      <option value="car_rental">car_rental </option>
	  <option value="car_repair">car_repair </option>
      <option value="car_wash">car_wash </option>
	  <option value="casino">casino </option>
      <option value="cemetery">cemetery </option>
	  <option value="church">church </option>
      <option value="city_hall">city_hall </option>
	  <option value="clothing_store">clothing_store </option>
      <option value="convenience_store">convenience_store </option>
	  <option value="courthouse">courthouse </option>
      <option value="dentist">dentist </option>
	  <option value="department_store">department_store </option>
      <option value="doctor">doctor </option>
	  <option value="electrician">electrician </option>
      <option value="electronics_store">electronics_store </option>
	  <option value="embassy">embassy </option>
      <option value="establishment">establishment </option>
	  <option value="finance">finance </option>
      <option value="fire_station">fire_station </option>
	  <option value="florist">florist </option>
      <option value="food">food </option>
	  <option value="funeral_home">funeral_home </option>
      <option value="furniture_store">furniture_store </option>
	  <option value="gas_station">gas_station </option>
      <option value="general_contractor">general_contractor </option>
	  <option value="grocery_or_supermarket">grocery_or_supermarket </option>
      <option value="gym">gym </option>
	  <option value="hair_care">hair_care </option>
      <option value="hardware_store">hardware_store </option>
	  <option value="health">health </option>
      <option value="hindu_temple">hindu_temple </option>
	  <option value="home_goods_store">home_goods_store </option>
      <option value="hospital">hospital </option>
	  <option value="insurance_agency">insurance_agency </option>
      <option value="jewelry_store">jewelry_store </option>
	  <option value="laundry">laundry </option>
      <option value="lawyer">lawyer </option>
	  <option value="library">library </option>
      <option value="liquor_store">liquor_store </option>
	  <option value="local_government_office">local_government_office </option>
      <option value="locksmith">locksmith </option>
	  <option value="lodging">lodging </option>
      <option value="meal_delivery">meal_delivery </option>
	  <option value="meal_takeaway">meal_takeaway </option>
      <option value="mosque">mosque </option>
	  <option value="movie_rental">movie_rental </option>
      <option value="movie_theater">movie_theater </option>
	  <option value="moving_company">moving_company </option>
      <option value="museum">museum </option>
	  <option value="night_club">night_club </option>
      <option value="painter">painter </option>
	  <option value="park">park </option>
      <option value="parking">parking </option>
	  <option value="pet_store">pet_store </option>
      <option value="pharmacy">pharmacy </option>
	  <option value="physiotherapist">physiotherapist </option>
      <option value="place_of_worship">place_of_worship </option>
	  <option value="plumber">plumber</option>
      <option value="police">police </option>
	  <option value="post_office">post_office </option>
      <option value="real_estate_agency">real_estate_agency </option>
	  <option value="restaurant">restaurant </option>
      <option value="roofing_contractor">roofing_contractor </option>
	  <option value="rv_park">rv_park </option>
      <option value="school">school </option>
	  <option value="shoe_store">shoe_store </option>
      <option value="shopping_mall">shopping_mall </option>
	  <option value="spa">spa </option>
      <option value="stadium">stadium </option>
	  <option value="storage">storage </option>
      <option value="store">store </option>
	  <option value="subway_station">subway_station </option>
      <option value="synagogue">synagogue </option>
	  <option value="taxi_stand">taxi_stand </option>
      <option value="train_station">train_station </option>
	  <option value="travel_agency">travel_agency </option>
	  <option value="university">university</option>
      <option value="veterinary_care">veterinary_care </option>
	  <option value="zoo">zoo</option>

     
    </select>
	
	
	
	 <input type='button'  value='Submit1' onclick="calcRoute2();"></input>
	 <input type='button'  value='Logout' onclick="logout();"></input>
    </div>
    <div id="map-canvas" style="float:left;width:70%; height:100%"></div>
    <div id="directionsPanel" style="float:right;width:30%;height 100%;">
    </div>
	
  </body>
</html>