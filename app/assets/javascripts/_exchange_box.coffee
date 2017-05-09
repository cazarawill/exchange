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
  $('#quantity').on 'change keyup', ->
    rate()

  $('#currency').change ->
    rate()

  $('#currency_destination').change ->
    rate()


  $('#change_currency').on 'change click', ->
    current = $("#currency").val()
    $("#currency").val($("#currency_destination").val()).change ->
    $("#currency_destination").val(current).change ->
rate()