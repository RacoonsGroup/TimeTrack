class TimeTrack.Views.CalendarAppView extends Backbone.View

  el: ".calendar_wrap"

  initialize: (args) ->
    @renderCalendar();

  renderCalendar: ->
    $(@el).html('Here will be rendered calendar')
