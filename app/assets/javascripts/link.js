$(document).ready(function(){
  changeStatus();
})

function changeStatus(){
  $('.links-list').on('click', '#toggle-link-status', function(e){
    console.log("hit")
    var button = e.target;
    toggleStatus(button);
    
  });
}

function toggleStatus(button){
  var status = $(button).data('status');
  var newStatus = !status;
  // storeNewStatus(button, newStatus);
}

// function storeNewStatus(button, newStatus){
//   
// }