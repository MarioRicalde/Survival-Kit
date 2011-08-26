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
