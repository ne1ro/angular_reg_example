# Profile data and logout
class ProfileCtrl extends BaseCtrl
  @register '$scope', '$state', 'Alert'

  # On controller init
  initialize: =>

  # Log out from the site
  logout: =>
    @Alert.info 'Goodbye!'
    @$state.go 'index'
