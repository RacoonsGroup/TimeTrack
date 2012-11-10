$ ->
  $('table#articles .btn').bind('click', ->
    $.ajax(
          url: $(this).data('url')
          dataType: 'json',
          type: 'post',
          data:
            id: $(this).data('id')
          success: ->
            alert('article updated')
            $(this).attr('disabled', true)
          error: ->
            $(this).attr('disabled', true)
        )
  )