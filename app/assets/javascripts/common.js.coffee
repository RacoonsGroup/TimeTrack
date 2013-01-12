jQuery ->
  jQuery('#from_date').datepicker(dateFormat: "dd.mm.yy")
  jQuery('#to_date').datepicker(dateFormat: "dd.mm.yy")

  jQuery('table#articles .btn').bind('click', ->
    element = this
    jQuery.ajax(
      url: jQuery(element).data('url'),
      dataType: 'json',
      type: 'get',
      data:
        id: jQuery(element).data('id')
      success: ->
        jQuery(element).attr('disabled', true)
        alert('article updated')
      error: ->
        jQuery(element).attr('disabled', true)
    )
  )
