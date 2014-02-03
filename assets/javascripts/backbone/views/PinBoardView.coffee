jQuery ->
  class nmPinBoard.PinBoardView extends Backbone.View
    el: $ 'body'
    initialize : ->
      Backbone.Validation.bind(@)
    remove : ->
      Backbone.Validation.unbind(@)