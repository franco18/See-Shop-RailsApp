$(document).ready(function(){
  $('#stores_search input').keyup(function(e){
    e.preventDefault();
    $(this).addClass("loadingInput");
    $.get($('#stores_search').attr('action'), $('#stores_search').serialize(), null, 'script')
    .complete(function(data){ $('#stores_search input').removeClass("loadingInput"); })
  });
  $("#toggle_store").collapse();
});
