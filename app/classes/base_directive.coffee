# Base layout for Angular.js directives
class @BaseDirective
  @register: ->
    app.directive "#{@name[0].toLowerCase()}#{@name[1..]}", @options
