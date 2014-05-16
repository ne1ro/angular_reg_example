# Registration and authentication controller
class RegCtrl extends BaseCtrl
  @register '$scope', '$state', '$cookieStore', 'Alert'

  # On controller init
  initialize: =>
    # Get profiles from the cookies
    @$scope.profiles = if @$cookieStore.get('profiles')?
      JSON.parse @$cookieStore.get('profiles')
    else
      []


  # Sign up new user
  signUp: (data) =>
    user = _.clone data
    user.passwordRepeated = undefined

    # Check for email existence
    unless data.email in _.pluck @$scope.profiles, 'email'
      @$scope.profiles.push user
      @$cookieStore.put 'profiles', JSON.stringify(@$scope.profiles)
      @$state.go 'profile'
      @Alert.success 'You have been successfully registered'
    else
      @Alert.warning 'E-mail address exists'


  # Log into the site
  logIn: (data) =>
    #@$state.go 'profile'
