app = angular.module("regApp", [
  'ngCookies'
  'ui.router'
]).run ($rootScope, Alert) ->
  Alert.info 'Sign up'
