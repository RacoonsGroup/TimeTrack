jQuery ->
  jQuery('.withDatepicker').datepicker({dateFormat: "dd.mm.yy", firstDay: 1})

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

  $('.link_to_pdf').bind('click', ->
    from = $('#from_date').val()
    to = $('#to_date').val()
    link = $(this).attr('href')
    if(from != '' && to != '')
      window.location = link + '?from=' + from + '&to=' + to
    else
      window.location = link
    return false
  )

  $('#new_time_entry #time_entry_project_id').val($.cookie('last_project'))

  $(document).on 'change', '#new_time_entry #time_entry_project_id', () ->
    $.cookie('last_project', $(this).val(), { expires: 31, path: '/' });

  $(document).on 'click', '.select_date', () ->
    start = $(this).data('start-date')
    end = $(this).data('end-date')
    $('#from_date').val(start)
    $('#to_date').val(end)