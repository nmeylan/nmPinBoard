class window.PinnedElement extends Backbone.Model

  defaults :
    id : -1
    title : "Your pinned element title"
    content : "Content of your element"
    created_on : Date.now()
    updated_on : Date.now()
    group_id : -1

  initialize : ->
    console.log('Pinned element Constructor')
