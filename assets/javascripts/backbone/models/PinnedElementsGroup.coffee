class nmPinBoard.PinnedElementsGroup extends Backbone.Model
  defaults :
    id : -1
    name : "Your pinned element group title"
    description : "A short description for your group"
    group_id : -1
    elements : new nmPinBoard.PinnedElements()

  initialize : ->
    console.log('Pinned element group Constructor')