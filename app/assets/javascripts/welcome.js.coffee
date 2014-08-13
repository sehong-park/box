# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
paintIt = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor
 
$(document).on "page:change", ->
  $("#pricing-form").change ->
    this.submit()
  $("#pricing-form").on("ajax:success", (e, data, status, xhr) ->
    alert "Success!"
#    $("#result").html(xhr)
  ).on("ajax:error", (e, xhr, status, error) ->
    alert "Error.."
  )
#    $("#result").html("<p>ERROR</p>"))
#    backgroundColor = $(this).data("background-color")
#    textColor = $(this).data("text-color")
#    paintIt(this, backgroundColor, textColor)
