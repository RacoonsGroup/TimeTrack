class TimeTrack.Routers.CalendarRouter extends Backbone.Router
  initialize: (options) ->
    # window.sectors ||= new Tixis.Collections.SectorsCollection()

  routes:
    ".*"  : "loadControls"

  loadControls: ->
    app = new TimeTrack.Views.CalendarAppView
