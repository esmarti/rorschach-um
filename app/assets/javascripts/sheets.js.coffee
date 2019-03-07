# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $ ->
#  $("a[data-evtBtn-shadowArea]").onMouse ->
#    backgroundColor = $(this).data("background-color")
#    textColor = $(this).data("text-color")
#    paintIt(this, backgroundColor, textColor)

#funcion for colour areas when mouse is over button in "area selector"
$ ->
 $("#areaButtons button").on 'mouseover', (event) -> this.className="proposed"

