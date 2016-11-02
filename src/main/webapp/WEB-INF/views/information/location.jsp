<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript"	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAFnGRVCulEtkiSXd6GPWJjZm0NEbuRr6w&sensor=false&libraries=places"></script>
<script type="text/javascript">
	var source, destination;
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();

	google.maps.event.addDomListener(window, 'load', function() {
		new google.maps.places.SearchBox(document.getElementById('txtSource'));
		new google.maps.places.SearchBox(document
				.getElementById('txtDestination'));
		directionsDisplay = new google.maps.DirectionsRenderer({
			'draggable' : true
		});
	});

	function GetRoute() {
		var mapOptions = {
			zoom : 7,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
		directionsDisplay.setMap(map);
		directionsDisplay.setPanel(document.getElementById('dvPanel'));

		//*********DIRECTIONS AND ROUTE**********************//
		source = document.getElementById("txtSource").value;

		destination = document.getElementById("txtDestination").value;
		var request = {
			origin : source,
			destination : destination,
			travelMode : google.maps.TravelMode.DRIVING
		};

		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(response);
			}
		});

		//*********DISTANCE AND DURATION**********************//
		var service = new google.maps.DistanceMatrixService();
		service.getDistanceMatrix({
			origins : [ source ],
			destinations : [ destination ],
			travelMode : google.maps.TravelMode.DRIVING,
			unitSystem : google.maps.UnitSystem.METRIC,
			avoidHighways : false,
			avoidTolls : false
		}, function(response, status) {
			if (status == google.maps.DistanceMatrixStatus.OK
					&& response.rows[0].elements[0].status != "ZERO_RESULTS") {
				var distance = response.rows[0].elements[0].distance.text;
				var duration = response.rows[0].elements[0].duration.text;
				var dvDistance = document.getElementById("dvDistance");
				dvDistance.innerHTML = "";
				dvDistance.innerHTML += "Distance: " + distance + "<br />";
				dvDistance.innerHTML += "Duration:" + duration;
			} else {
				alert("Unable to find the distance via road.");
			}
		});
	}
</script>
</head>
<body>
	<div class="container">
		<!-- content start -->
		<div class="u_title"><h2>LOCATION</h2></div>
		<table>
			<tr>
				<td colspan="2" class="form-inline">Source
					<input type="text" id="txtSource" placeholder="enter the source" class="form-control"/>
					Destination
					<input type="text" id="txtDestination" value="Canberra, Australian Capital Territory, Australia" class="form-control"/>
					<input type="button" value="Get Route" class="form-control btn btn-success btn-sm" onclick="GetRoute()" /> 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="dvDistance"></div>
				</td>
			</tr>

			<tr>
				<td>
					<div id="dvMap" style="width: 500px; height: 500px"></div>
				</td>

				<td>
					<div id="dvPanel" style="width: 500px; height: 500px"></div>
				</td>
			</tr>
		</table>

	</div>
		<!-- content end -->
	
</body>
</html>