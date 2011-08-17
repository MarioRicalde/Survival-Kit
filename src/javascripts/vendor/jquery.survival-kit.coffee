$.ns('sk').add {
  # Search Box Helper
  searchBox: ->
    input = $('input.text', this)
    default_mes = input.val()
    input.focus(->
      if input.val() == default_mes
        input.val ''
    ).blur(->
      if input.val() == ''
       input.val default_mes
    )
    
  # Simple Form Style Helper.
  simpleForms: ->
    max = 0
    labels = $("> div:not(.boolean) > label", this)
    log(labels)
    labels.each ->
      if $(this).width() > max
        max = $(this).width()
    $('> .hint.padded', this).css 'padding-left' : max
    labels.width(max)
}

window.log = (e) ->
  console.log(e) if this.console
  # log.history = log.history || [];  
  # log.history.push(arguments);
  # arguments.callee = arguments.callee.caller;  
  # console.log( Array.prototype.slice.call(arguments) ) if this.console
  
