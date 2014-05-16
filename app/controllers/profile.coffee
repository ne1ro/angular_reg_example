# Profile data and logout
class ProfileCtrl extends BaseCtrl
  @register '$scope', '$state', '$cookieStore', 'Alert'

  # On controller init
  initialize: =>
    # Get session data
    if @$cookieStore.get('session')?
      @$scope.user = JSON.parse @$cookieStore.get('session')
    else
      @Alert.danger 'Unauthorized access'
      @$state.go 'index'

  # Log out from the site
  logout: =>
    @$cookieStore.remove 'session'
    @Alert.info 'Goodbye!'
    @$state.go 'index'
