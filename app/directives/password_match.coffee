# Check for password matching
class PasswordMatch extends BaseDirective
  @options: =>
    require: "ngModel"
    scope: true
    link: (scope, elm, attrs, ngModelCtrl) ->
      check = ->
        # Check passwords equality
        val1 = scope.$eval attrs.ngModel
        val2 = scope.$eval attrs.passwordMatch
        val2 is val1

      # Watch for password changes
      scope.$watch check, (res) ->
        # Set validation
        ngModelCtrl.$setValidity "matchPass", res

  @register()
