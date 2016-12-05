function deleteTag(){
  $('.delete-tag').on('click', function(e){
    var tag = e.target
    var tagId = $(tag).data('id')
    var linkTagId = $(tag)[0].id.trim()
    $.ajax({
      method: "DELETE",
      url: "api/v1/link_tags/" + linkTagId,
      dataType: "json",
      success: removeLinkTag(tag)
    });
  });
}

function removeLinkTag(button){
  $(button).prev().remove();
  $(button).remove();
}