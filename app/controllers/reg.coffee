# Registration and authentication controller
class RegCtrl extends BaseCtrl
  @register '$scope', '$state', '$cookieStore', 'Alert'

  # On controller init
  initialize: =>
    # Get profiles from the cookies
    @$scope.profiles = if @$cookieStore.get('profiles')?
      JSON.parse(@$cookieStore.get('profiles')).reverse()
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
      @$cookieStore.put 'session', JSON.stringify(user)
      @$state.go 'profile'
      @Alert.success 'You have been successfully registered'
    else
      @Alert.warning 'E-mail address exists'


  # Log into the site
  logIn: (data) =>
    # Find user in profiles by email and password
    user = _.find @$scope.profiles, (user) ->
      user.password is data.password and user.email is data.email

    if user?
      @$cookieStore.put 'session', JSON.stringify(user)
      @$state.go 'profile'
      @Alert.success 'Welcome back!'
    else
      @Alert.warning 'Incorrect data, try again'
