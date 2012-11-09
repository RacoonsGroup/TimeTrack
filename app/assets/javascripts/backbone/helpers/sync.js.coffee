(->
  methodMap =
    create: "POST"
    update: "PUT"
    delete: "DELETE"
    read: "GET"

  getUrl = (object) ->
    return null  unless object and object.url
    (if _.isFunction(object.url) then object.url() else object.url)

  urlError = ->
    throw new Error("A 'url' property or function must be specified")

  window.Backbone.sync = (method, model, options) ->
    type = methodMap[method]
    params = _.extend(
      type: type
      dataType: "json"
      beforeSend: (xhr) ->
        token = $("meta[name=\"csrf-token\"]").attr("content")
        xhr.setRequestHeader "X-CSRF-Token", token  if token
        model.trigger "sync:start"
    , options)
    params.url = getUrl(model) + ".json" or urlError()  unless params.url
    if not params.data and model and (method is "create" or method is "update")
      params.contentType = "application/json"
      data = {}
      if model.paramRoot
        data[model.paramRoot] = model.toJSON()
      else
        data = model.toJSON()
      params.data = JSON.stringify(data)
    params.processData = false  if params.type isnt "GET"
    complete = options.complete
    options.complete = (jqXHR, textStatus) ->
      model.trigger "sync:end"
      complete jqXHR, textStatus  if complete

    $.ajax params
).call this