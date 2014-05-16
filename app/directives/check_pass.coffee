# Check for strong password
class CheckPass
  constructor: () ->
    # Test valid password
    isValid = (s) ->
      s and s.length > 7 and /\D/.test(s) and /\d/.test(s)
    
    # Directive link function
    link = (scope, elm, attrs, ngModelCtrl) ->
      # Parse valid password value
      ngModelCtrl.$parsers.unshift (viewValue) ->
        ngModelCtrl.$setValidity "strongPass", isValid(viewValue)
        viewValue

      # Format validation
      ngModelCtrl.$formatters.unshift (modelValue) ->
        ngModelCtrl.$setValidity "strongPass", isValid(modelValue)
        modelValue
    
    return {
      require: "ngModel"
      link
    }

angular.module('regApp').directive 'checkPass', CheckPass
