function search(){
  var $search = $("#search-bar")
  $search.on('keyup', function(){
    var $links = $('.link');
    var userInput = $search.val().toLowerCase();
    $links.each(function(){
      var title = $(this).find(".title-field").text()
      var url = $(this).find(".url-field").text()
      if(title.toLowerCase().indexOf(userInput) === -1 && url.toLowerCase().indexOf(userInput) === -1){
        $(this).hide();
      } else {
        $(this).show();
      }
    });
  });
}