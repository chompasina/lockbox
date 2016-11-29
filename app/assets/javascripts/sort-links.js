function sort(){
  // var table = $('table');
  // var links = $table.find('tbody');
  $('.sort-button').on('click', function(e){
    var $table = $('table')
    var $tableBody = $table.find('tbody');
    // var links = $('#links');
    var links = $('.link');
    links.sort(function(a, b){
      return $(a).children("td.title-field").text().toUpperCase().localeCompare($(b).children("td.title-field").text().toUpperCase());
    })
    
  })
}