# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    event.stopImmediatePropagation()

  $('#close-flash').on 'click', (event) ->
    $(this).closest('.flash-message-div').hide()
    event.preventDefault()

jQuery ->
  $("#phone_new").mask("(999) 999-9999")

jQuery ->
  $("#phone_new_date").mask("(999) 999-9999")
  
jQuery ->
  $("#phone_new_date_edit").mask("(999) 999-9999")

