# Create Bootstrap alerts dynamically
class Alert extends BaseService
  @register '$rootScope', '$anchorScroll'

  initialize: ->
    @$anchorScroll()
    _.each ['success', 'info', 'warning', 'danger'], (name) ->
      Alert::[name] = (message, description = '') ->
        @$rootScope.alert =
          message: message
          class: name
          descr: description
