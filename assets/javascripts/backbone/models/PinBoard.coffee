class window.PinBoard extends Backbone.Model

  defaults :
    id : -1
    title : "Your pin board title"
    description : "A short description for your pin board"
    created_on : Date.now()
    updated_on : Date.now()
    owner_id : -1

  initialize : ->
    console.log('Pin board Constructor')