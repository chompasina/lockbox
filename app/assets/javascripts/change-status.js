function changeStatus(){
  $('#links-list').on('click', '#toggle-link-status', function(e){
    console.log("hit")
    var button = e.target;
    toggleStatus(button);
  });
}

function toggleStatus(button){
  var status = $(button).data('status');
  console.log(status)
  var newStatus = (!status);
  console.log(newStatus);
  storeNewStatus(button, newStatus);
}

function storeNewStatus(button, newStatus){
  var linkId = $(button).data('id')
    $.ajax({
      method: "PUT",
      url: "/api/v1/links/" + linkId + '.json',
      data: {id: linkId, read: newStatus},
      success: function(){
        var id = $(button).data('id');
        var row = $('.link-row[data-id="' + id +'"]');
        updateButton(id, row);
      }
    })
}

function updateButton(id, row){
  var $button = $('.button[data-id="' + id + '"]')
  var $url = $('.url-field[data-id="' + id + '"]')
  var $linkRead = $('#link-status-'+ id + '' )
  if($button.text() === 'Mark as Unread'){
      $button.text("Mark as Read");
      $linkRead.text("Read? false");
      $url[0].style['cssText'] = 'text-decoration: none;'
  } else {
    $button.text("Mark as Unread");
    $url[0].style['cssText'] = 'text-decoration: line-through;';
    $linkRead.text("Read? true")
  }
}