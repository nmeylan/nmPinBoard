class nmPinBoard.ElementCustomization extends Backbone.Model

  defaults :
    id : -1
    color : "blue"
    position :
      offsetX : 50
      offsetY : 50
    size :
      width : "80px"
      height : "50px"
    opacity : 1

  initialize : ->