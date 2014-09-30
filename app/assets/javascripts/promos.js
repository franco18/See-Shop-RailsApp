$(document).ready(function(){
  $('#promos_search input').keyup(function(e){
  e.preventDefault();
  $(this).addClass("loadingInput");
  $.get($('#promos_search').attr('action'), $('#promos_search').serialize(), null, 'script')
  .complete(function(data){ $('#promos_search input').removeClass("loadingInput"); })
 });
  $("#toggle_promo").collapse();
});
