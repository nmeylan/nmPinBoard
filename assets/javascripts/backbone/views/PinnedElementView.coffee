jQuery ->
  class nmPinBoard.PinnedElementView extends Backbone.View

    initialize : ->
      Backbone.Validation.bind(@)
      @render()

    remove : ->
      Backbone.Validation.unbind(@)

    render : ->
      variables = {
        title : @model.attributes.title
        content : @model.attributes.content
      }
      template = _.template($('#pinboard_element_template').html(), variables)
      $('#pinboard_body').append(template)

      $(".draggable").draggable({snap : true, stack: ".draggable"})