class nmPinBoard.ElementCustomization extends Backbone.Model

  defaults :
    id : -1
    color : "blue"
    position :
      offsetX : 50
      offsetY : 50
    opacity : 1

  initialize : ->