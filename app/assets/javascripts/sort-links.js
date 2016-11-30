function sort(){
  $('.sort-button').on('click', function(e){
    var $table = $('table')
    var links = $('.link');
    links.sort(function(a, b){
      return $(a).children("td.title-field").text().toUpperCase().localeCompare($(b).children("td.title-field").text().toUpperCase());
    })
    $.each(links, function(_i, link) { $table.append(link); });
  });
}