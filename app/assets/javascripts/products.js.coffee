# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:load', ->
  $('main').click(animate
    width: '+200px'
    opacity: '.5'
    500)

$(document).on 'page:fetch', ->
  $('main').animate
    opacity: '0.3'
    200


$(document).on 'page:restore', ->
  $('img').animate
    width: '600px'
    opacity: '1'
    1000
