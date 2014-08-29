# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
toggleOrderingButton = (isChecked) ->
  $('#ordering_btn').prop("disabled", !isChecked)

$(document).on "page:change", ->
  $("#order_extra_checked").change ->
    checked = $("#order_extra_checked").is(':checked')
    toggleOrderingButton(checked)
    
  