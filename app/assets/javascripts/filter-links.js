function filter(){
  $('.filter').on('click', function(e){
    var clicked = e.target;
    var clickedFilter = $(clicked).text();
    // debugger;
    var clickedFilter = clickedFilter === "Read" ? true : false;
    var $links = $('.link');
    $links.each(function(){
      var status = ($(this).data("status"));
      if(status !== clickedFilter){
        $(this).hide();
      } else {
        $(this).show();
      }
    })
  })
}