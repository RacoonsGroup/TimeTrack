jQuery ($) ->
  Common =
    init: ->
      @bindEvents()

    bindEvents: ->
      $(document).on 'change', '#new_time_entry #time_entry_project_id', @saveLastProject
      $(document).on 'click', '.copy-btn', @copyRealTime
      $(document).on 'click', '.select_date', @dateFastSelect
      $(document).on 'click', '.get_report ul.dropdown-menu a', @downloadReport
      $(document).on 'click', 'table#articles .btn', @changeArticleStatus
      $(document).ready @multiselect
      @pageLoaded()

    saveLastProject: ->
      $.cookie('last_project', $(this).val(), { expires: 31, path: '/' });

    copyRealTime: ->
      realTime = $(this).closest('.real-time-block').find('input.real_time').val()
      $('#time_entry_time_points').val(realTime)

    dateFastSelect: ->
      start = $(this).data('start-date')
      end = $(this).data('end-date')
      $('#from_date').val(start)
      $('#to_date').val(end)

    downloadReport: ->
      data = $('form.statistic_fields').serialize()
      report_type = $(this).data('type')
      link = $(this).attr('href')
      window.location = link + '?' + data + '&report_type=' + report_type
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

    multiselect: ->
      $(".multiselect").chosen();

  Common.init()