$(document).ready(function(){
  live_search();
  $("#toggle_promo").collapse();
});

function live_search(){
  $('#promos_search input').keyup(function(e){
  e.preventDefault();
  $(this).addClass("loadingInput");
  $.get($('#promos_search').attr('action'), $('#promos_search').serialize(), null, 'script')
  .complete(function(data){ $('#promos_search input').removeClass("loadingInput"); })
 });
}
