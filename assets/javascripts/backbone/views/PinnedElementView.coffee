jQuery ->
  class nmPinBoard.PinnedElementView extends Backbone.View
    el: $ 'body'
    initialize : ->
      Backbone.Validation.bind(@)
    remove : ->
      Backbone.Validation.unbind(@)