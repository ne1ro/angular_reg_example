# Base layout for Angular.js services
class @BaseService
  # Register this service
  @register: (args...) ->
    app.service @name, this
    @$inject = args


  constructor: (args...) ->
    # Inject dependencies
    for key, index in @constructor.$inject
      this[key] = args[index]

    @initialize?()
