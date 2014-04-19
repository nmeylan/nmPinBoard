jQuery ->
  class nmPinBoard.PinnedElementView extends Backbone.View

    initialize: ->
      Backbone.Validation.bind(@)
      @render()

    remove: ->
      Backbone.Validation.unbind(@)

    render: ->
      self = @
      variables = {
        guid: nmPinBoard.guid()
        title: @model.attributes.title
        content: @model.attributes.content
      }
      template = _.template($('#pinboard_element_template').html(), variables)
      $('#pinboard_body').append(template)
      $(".pinboard_element").resizable({minHeight: 150, minWidth: 200}).draggable({snap: true, stack: ".draggable", drag: (event, ui) -> self.dragHandler(event, ui)})

    stopDragHandler:(event, ui) ->

    dragHandler: (event, ui) ->
      top = ui.position.top
      left = ui.position.left
      $.each($(".pinboard_element.ui-selected"), (index, value) ->
        element = $(@)
        unless(element.attr('id') == ui.helper.attr('id'))
          element.position({'top': top,'left': left})


        return
      )