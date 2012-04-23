# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
(($) ->
  $.fn.highlight = ->
    $(this).css
      color: "red"
      background: "yellow"

    $(this).fadeIn()

  $("#concedente_telefone_com_mascara").mask "(999) 999-9999"
  $("#concedente_telefone_com_mascara").change ->
    $("#concedente_telefone").value = ""
) jQuery


