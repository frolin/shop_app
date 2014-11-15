# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:load', ->
  $('img').click(animate
    left: '100px'
    opacity: '.5'
    500)

#$(document).on 'page:fetch', ->
#  $('img').animate
#    width: '+200px'
#    opacity: '1'
#    1000

#$(document).on 'page:restore', ->
#  $('img').animate
#    width: '-400px'
#    opacity: '1'
#    1000
