function editTitle(){
  $('#links-list').on('keypress', '.title-field', function(e){
    if(e.which == 13){
      var $link = $(this);
      var $updated = $link.text();
      var updateParams = {
        title: $updated.trim()
      };
      $.ajax({
        method: 'PUT',
        url: 'api/v1/links/' + $link.data('id') + '.json',
        data: updateParams,
        error: function(errorResponse) {
         var errors = $.parseJSON(errorResponse.responseText).errors
         displayErrors(errors);
       }
      });
      $(this).blur();
      window.getSelection().removeAllRanges();
    }    
  });
}

function editTitleOnClick(){
  $('#links-list').on('focusout', '.title-field', function(e){
      var $link = $(this);
      var $updated = $link.text();
      var updateParams = {
        title: $updated.trim()
      };
      $.ajax({
        type: 'PUT',
        url: 'api/v1/links/' + $link.data('id') + '.json',
        data: updateParams,
        error: function(errorResponse) {
         var errors = $.parseJSON(errorResponse.responseText).errors
         displayErrors(errors);
       }
      });
      $(this).blur();
      window.getSelection().removeAllRanges();
  });
}

function editUrlOnClick(){
  $('#links-list').on('focusout', '.url-field', function(e){
    var $link = $(this);
    var $updated = $link.text();
    var updateParams = {
      url: $updated.trim()
    };
    $.ajax({
      type: 'PUT',
      url: 'api/v1/links/' + $link.data('id') + ".json",
      data: updateParams,
      error: function(errorResponse) {
         var errors = $.parseJSON(errorResponse.responseText).errors
         displayErrors(errors);
       }
    });
    $(this).blur();
    window.getSelection().removeAllRanges();
  });  
}

function editUrl(){
  $('#links-list').on('keypress', '.url-field', function(e) {
    if(e.which === 13){
    var $link = $(this);
    var $updated = $link.text();
    var updateParams = {
      url: $updated.trim()
    };
    $.ajax({
      type: 'PUT',
      url: 'api/v1/links/' + $link.data('id') + ".json",
      data: updateParams,
      error: function(errorResponse) {
         var errors = $.parseJSON(errorResponse.responseText).errors
         displayErrors(errors);
       }
    });
    $(this).blur();
    window.getSelection().removeAllRanges();
    }
  })
}

