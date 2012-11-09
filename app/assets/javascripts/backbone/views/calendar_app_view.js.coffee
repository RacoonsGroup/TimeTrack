class TimeTrack.Views.CalendarAppView extends Backbone.View

  base_template: JST["backbone/templates/calendar/base_structure"]

  el: ".calendar_wrap"

  initialize: (args) ->
    @renderCalendar();

  renderCalendar: ->
    $(@el).html(@base_template(headers: moment.weekdays))
