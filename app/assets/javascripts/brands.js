$(document).ready(function(){
  $('#brands_search input').keyup(function(e){
    e.preventDefault();
    $(this).addClass("loadingInput");
    $.get($('#brands_search').attr('action'), $('#brands_search').serialize(), null, 'script')
    .complete(function(data){ $('#brands_search input').removeClass("loadingInput"); })
  });
  $("#toggle_brand").collapse();
});
