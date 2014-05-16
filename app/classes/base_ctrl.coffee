# Base layout for Angular.js controllers
class @BaseCtrl
  # Register app controller
  @register: (args...) ->
    app.controller @name, this
    @$inject = args


  constructor: (args...) ->
    # Inject dependencies
    for key, index in @constructor.$inject
      this[key] = args[index]

    # Bind functions
    for key, fn of @constructor.prototype
      continue unless typeof fn is 'function'
      continue if key in ['constructor', 'initialize'] or key[0] is '_'
      @$scope[key] = _.bind fn, this

    @initialize?()
