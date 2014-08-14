# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# 1. http://coffeescriptcookbook.com/chapters/jquery/ajax
# 2. http://5minutenpause.com/blog/2014/03/28/submit-remote-forms-with-jquery-in-rails/
# 3. http://stackoverflow.com/questions/7962693/coffeescript-and-jquery-post-success-callback
$(document).on "page:change", ->
  $("#pricing-form").change ->
    $.ajax this.action,
        type: 'GET'
        dataType: 'script'
        data: $(this).serialize()
    
    