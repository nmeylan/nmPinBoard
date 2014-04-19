jQuery ->
  class nmPinBoard.PinBoardView extends Backbone.View
    el: $ 'body'
    elTitleId : '#pinboard_title'
    elEditTitleId : "#edit_pinboard_title"
    elDescriptionId : '#pinboard_description'
    elEditDescriptionId : "#edit_pinboard_description"
    elAddId : '#add_element'
    pinnedElementViews : []

    initialize : ->
      Backbone.Validation.bind(@)
      @render()
    remove : ->
      Backbone.Validation.unbind(@)
    render : ->
      @renderHeader()
      @renderBody()

    renderHeader : ->
      variables = {
        title: @model.attributes.title
        description : @model.attributes.description
      }
      template = _.template( $('#pinboard_header_template').html(), variables )
      $('#pinboard_header').html(template)

    renderBody : ->
      $("#pinboard_body").selectable()

    events :
      'click #add_element' : 'doAddElement'
      'dblclick #pinboard_title' : 'doEditTitle'
      'blur #pinboard_title' : 'doUpdateTitle'
      'dblclick #pinboard_description' : 'doEditDescription'
      'blur #pinboard_description' : 'doUpdateDescription'


    doAddElement : ->
      view = new nmPinBoard.PinnedElementView({model : new nmPinBoard.PinnedElement()})
      @pinnedElementViews.push view
      @model.elements.push view.model

    doEditTitle : ->
      @doEdit(@elTitleId, @elEditTitleId)

    doUpdateTitle : ->
      @doUpdate(@elTitleId, 'title')

    doEditDescription : ->
      @doEdit(@elDescriptionId, @elEditDescriptionId)

    doUpdateDescription : ->
      @doUpdate(@elDescriptionId, 'description')

    doEdit : (elementId, elementInputId)->
      element = $(elementId)
      unless element.hasClass("editing")
        element.html("<input type='textfield' id='"+elementInputId+"' value='"+element.text()+"' class='edit_header'/>")
        input = element.children()[0]
        input.selectionStart = input.selectionEnd = input.value.length;
        element.addClass('editing')

    doUpdate : (elementId, attribute) ->
      element = $(elementId)
      if element.hasClass("editing")
        val = element.children()[0].value
        old = @model.attributes[attribute]
        @model.attributes[attribute] = val
        @model.validate()
        if(@model.isValid(true))
          element.html(@model.attributes[attribute])
        else
          element.html(old)
        element.removeClass('editing')