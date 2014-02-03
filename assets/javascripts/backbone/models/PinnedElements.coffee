class nmPinBoard.PinnedElements extends Backbone.Collection
  model : nmPinBoard.PinnedElement

  initialize : ->
    console.log("Pinned elements collection constructor")