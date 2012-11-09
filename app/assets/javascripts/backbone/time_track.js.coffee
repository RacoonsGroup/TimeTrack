#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./helpers

window.TimeTrack =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    new TimeTrack.Routers.CalendarRouter()
