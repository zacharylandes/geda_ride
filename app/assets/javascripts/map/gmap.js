var rideDistance = 0;

function initMap() {
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 3,
    center: {lat: 41.85, lng: -87.65}
  });
  directionsDisplay.setMap(map);

    calculateAndDisplayRoute(directionsService, directionsDisplay);
}
//
// function cost(ride_id,ride_distance){
//   debugger;
//   $(document).ready(function(ride_id,ride_distance){
//         $.ajax({
//           url : "/rides/"+ride_id,
//           type : "PATCH",
//           dataType: "json",
//           data : {"text":"2,172 mi"}
//       });
//   });
// }

function calculateAndDisplayRoute(directionsService, directionsDisplay) {

  directionsService.route({
    origin: document.getElementById('start').innerHTML,
    destination: document.getElementById('end').innerHTML,
    travelMode: 'DRIVING'
  }, function(response, status) {
    if (status === 'OK') {
      directionsDisplay.setDirections(response);
      var route = response.routes[0];
      var summaryPanel = document.getElementById('directions-panel');
      var ride_id = document.getElementById('ride_id').innerHTML;

      summaryPanel.innerHTML = '';

      for (var i = 0; i < route.legs.length; i++) {
        var ride = document.getElementById('ride_id').innerHTML;
        var routeSegment = i + 1;
        // summaryPanel.innerHTML += route.legs[i].start_address + ' to <br>';
        // summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
        summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
        var ride_distance = route.legs[i].distance

        $.ajax({
          url : "/rides/"+ ride_id,
          type : "PATCH",
          dataType: "json",
          data : ride_distance
          // event.preventDefault;
      });


        }
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
}
