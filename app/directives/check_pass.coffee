# Check for strong password
class CheckPass extends BaseDirective
  # Test valid password
  _isValid = (s) ->
    s and s.length > 7 and /\D/.test(s) and /\d/.test(s)

  @options: =>
    require: 'ngModel'
    # Two-way binding
    link: (scope, elm, attrs, ngModelCtrl) ->
      console.log 'wut'
      # Parse valid password value
      ngModelCtrl.$parsers.unshift (viewValue) ->
        ngModelCtrl.$setValidity "strongPass", _isValid(viewValue)
        viewValue

      # Format validation
      ngModelCtrl.$formatters.unshift (modelValue) ->
        ngModelCtrl.$setValidity "strongPass", _isValid(modelValue)
        modelValue

  @register()

console.log CheckPass.options
