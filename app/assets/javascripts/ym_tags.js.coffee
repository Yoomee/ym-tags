#= require autocomplete-rails

YmTags =
  Input:
    init: () ->
      $('input[data-autocomplete]').live 'keydown', (event) ->
        if (event.keyCode == $.ui.keyCode.TAB)
          event.preventDefault()
					
$(document).ready ->
  YmTags.Input.init()