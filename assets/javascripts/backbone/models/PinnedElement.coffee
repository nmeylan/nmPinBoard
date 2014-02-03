class nmPinBoard.PinnedElement extends Backbone.Model

  defaults :
    id : -1
    title : "Your pinned element title"
    content : "Content of your element"
    created_on : Date.now()
    updated_on : Date.now()
    group_id : -1
    customization : {}

  validation :
    title :
      required: true
      msg : "Title can't be blank"
    content :
      required: true
      msg : "Content can't be blank"
    customization : ->
      console.log(@.get("customization").get("opacity"))
      if(@.get("customization").get("color").trim() == '')
        return "Color can't be blank"
      if(isNaN(@.get("customization").get("position").offsetX))
        return "X position errors : not a number (how is it possible?)"
      if(isNaN(@.get("customization").get("position").offsetY))
        return "Y position errors : not a number (how is it possible?)"
      if(isNaN(@.get("customization").get("opacity")))
        return "Opacity errors : not a number (how is it possible?)"
      if(!isNaN(@.get("customization").get("opacity")) && (@.get("customization").get("opacity") > 1 || @.get("customization").get("opacity") < 0))
        return "Opacity errors : value must be contains in 0..1 range"

  initialize : ->
    @.set("customization" : new nmPinBoard.ElementCustomization())
    console.log('Pinned element Constructor')
