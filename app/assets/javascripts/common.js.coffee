$ ->
  $('table#articles .btn').bind('click', ->
    element = this
    $.ajax(
      url: $(element).data('url'),
      dataType: 'json',
      type: 'get',
      data:
        id: $(element).data('id')
      success: ->
        $(element).attr('disabled', true)
        alert('article updated')
      error: ->
        $(element).attr('disabled', true)
    )
  )