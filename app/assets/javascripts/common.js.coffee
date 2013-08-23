jQuery ($) ->
  Common =
    init: ->
      @bindEvents()

    bindEvents: ->
      $(document).on 'change', '#new_time_entry #time_entry_project_id', @saveLastProject
      $(document).on 'click', '.copy-btn', @copyRealTime
      $(document).on 'click', '.select_date', @dateFastSelect
      $(document).on 'click', '.link_to_pdf', @downloadPDF
      $(document).on 'click', 'table#articles .btn', @changeArticleStatus
      @pageLoaded

    saveLastProject: ->
      $.cookie('last_project', $(this).val(), { expires: 31, path: '/' });

    copyRealTime: ->
      realTime = $(this).closest('.real-time-block').find('input').val()
      $('#time_entry_time_points').val(realTime)

    dateFastSelect: ->
      start = $(this).data('start-date')
      end = $(this).data('end-date')
      $('#from_date').val(start)
      $('#to_date').val(end)

    downloadPDF: ->
      from = $('#from_date').val()
      to = $('#to_date').val()
      link = $(this).attr('href')
      link = link + '?from=' + from + '&to=' + to if from != '' && to != ''
      window.location = link
      false

    changeArticleStatus: ->
      element = this
      $.ajax
        url: $(element).data('url'),
        dataType: 'json',
        type: 'get',
        data:
          id: $(element).data('id')
        success: (data) ->
          if data
            $(element).removeClass('btn-success').addClass('btn-danger').text('Mark as unread').closest('tr').find('.labeled span.label').text('Read').addClass('label-success')
          else
            $(element).removeClass('btn-danger').addClass('btn-success').text('Mark as read').closest('tr').find('.labeled span.label').text('Unread').removeClass('label-success')
        error: ->
          alert('Ooops! Error!')

    pageLoaded: ->
      $('#new_time_entry #time_entry_project_id').val($.cookie('last_project')) # set last project from cookie
      $('.withDatepicker').datepicker({dateFormat: "dd.mm.yy", firstDay: 1}) # set dateSelector to inputs

  Common.init()