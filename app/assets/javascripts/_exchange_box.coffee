rate = ->
  if $('form').attr('action') == '/exchange'
   $.ajax '/exchange',
    type: 'POST'
    dataType: 'json'
    data: {
            currency: $("#currency").val(),
            currency_destination: $("#currency_destination").val(),
            quantity: $("#quantity").val()
          }
    error: (jqXHR, textStatus, errorThrown) ->
      alert textStatus
    success: (data, text, jqXHR) ->
      $('#result').val(data.value)
  return false;

$(document).ready ->
  $('#quantity').keyup ->
    rate()
  $('#currency').change ->
    rate()
  $('#currency_destination').change ->
    rate()
  $('#change_currency').click ->
    current = $("#currency").val()
    $("#currency").val($("#currency_destination").val())
    $("#currency_destination").val(current)
    $('#change_currency').change ->
rate()