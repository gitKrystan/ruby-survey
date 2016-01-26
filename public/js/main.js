$(function() {
  var counter = 2;
  $("#add-response").on("click",function(e) {
    $('#responses').append($('<div/>', {'class': 'form-group'})
                   .append($('<input>', {'class': 'form-control', 'name': 'response' + counter})));
    $("#response_count").val(counter);
    counter++;
  });
});
