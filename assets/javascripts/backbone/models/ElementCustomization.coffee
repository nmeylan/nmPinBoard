class nmPinBoard.ElementCustomization extends Backbone.Model

  defaults :
    color : "blue"
    position :
      offsetX : 50
      offsetY : 50
    opacity : 1

  initialize : ->
    console.log("Customization constructor")