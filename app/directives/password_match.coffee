# Check for password matching
class PasswordMatch
  constructor: ->
    return {} =
      require: "ngModel"
      scope: true
      restrict: 'A'
      link: (scope, elm, attrs, ngModelCtrl) ->
        check = ->
          # Check passwords equality
          val1 = scope.$eval attrs.ngModel
          val2 = scope.$eval attrs.passwordMatch
          val2 is val1

        # Watch for password changes
        scope.$watch check, (n) ->
          # Set validation
          ngModelCtrl.$setValidity "matchPass", n

angular.module('regApp').directive 'passwordMatch', PasswordMatch
