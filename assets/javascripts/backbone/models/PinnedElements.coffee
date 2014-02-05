class nmPinBoard.PinnedElements extends Backbone.Collection
  model : nmPinBoard.PinnedElement
  localStorage: new Backbone.LocalStorage("PinnedElements")
  initialize : ->