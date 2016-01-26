$(function() {
  var counter = $(".new_response").length + 1;
  $("#add-response").on("click",function(e) {
    $('#responses').append($('<div/>', {'class': 'form-group new_response'})
                   .append($('<input>', {'class': 'form-control', 'name': 'response' + counter})));
    $("#response_count").val(counter);
    counter++;
  });
});
