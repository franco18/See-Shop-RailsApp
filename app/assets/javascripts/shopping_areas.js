var map;
var markers = [];
$(document).ready(function() {
  live_search();
  if ($("form.simple_form").length) {
    if (has_location()){
      var my_location = new google.maps.LatLng(parseFloat($("#shopping_area_latitude").val()),parseFloat($("#shopping_area_longitude").val()));
      initialize_map(my_location, 15, true);
      addMarker(my_location);
    } else {
      var medellin = new google.maps.LatLng(6.21969155390631, -75.5735492671374)
      initialize_map(medellin, 12, true);
    }
  }
  if ($("#show_shopping_area").length){
    var my_location = new google.maps.LatLng(parseFloat($("#lat").html()),parseFloat($("#lng").html()));
    initialize_map(my_location,15, false);
    addMarker(my_location);
  }
  $("#toggle_shopping_area").collapse();
});

function live_search(){
  $('#shopping_areas_search input').keyup(function(e){
    e.preventDefault();
    $(this).addClass("loadingInput");
    $.get($('#shopping_areas_search').attr('action'), $('#shopping_areas_search').serialize(), null, 'script')
    .complete(function(data){ $('#shopping_areas_search input').removeClass("loadingInput"); })
  });
}

function initialize_map(location, zoom, click_event) {
  var mapOptions = {
    center: location,
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map_canvas"),
      mapOptions);

  // This event listener will call addMarker() when the map is clicked.
  if (click_event){
    google.maps.event.addListener(map, 'click', function(event) {
      addMarker(event.latLng);
      setValueLatLng(event.latLng);
    });
  }
}

function has_location(){
  if ($("#shopping_area_longitude").val()!= "" &&
      $("#shopping_area_latitude").val() != ""){
    return true;
  }
  return false;
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
