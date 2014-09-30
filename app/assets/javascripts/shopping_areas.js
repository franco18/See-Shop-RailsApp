$(document).ready(function() {
  initialize();
  $(".collapse").collapse();
  $("#shopping_area_longitude").val("");
  $("#shopping_area_latitude").val("");
});

var map;
var markers = [];

function initialize() {
  var medellin = new google.maps.LatLng(6.21969155390631, -75.5735492671374)
  var mapOptions = {
    center: medellin,
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map_canvas"),
      mapOptions);

  // This event listener will call addMarker() when the map is clicked.
  google.maps.event.addListener(map, 'click', function(event) {
    addMarker(event.latLng);
    setValueLatLng(event.latLng);
  });
}

function setValueLatLng(location){
  $("#shopping_area_longitude").val(location.lng());
  $("#shopping_area_latitude").val(location.lat());
}

// Add a marker to the map and push to the array.
function addMarker(location) {
  deleteMarkers();
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  markers.push(marker);
}

// Sets the map on all markers in the array.
function setAllMap(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setAllMap(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setAllMap(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
  clearMarkers();
  markers = [];
}
