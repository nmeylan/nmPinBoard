// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  jQuery(function() {
    return nmPinBoard.PinnedElementView = (function(_super) {
      __extends(PinnedElementView, _super);

      function PinnedElementView() {
        return PinnedElementView.__super__.constructor.apply(this, arguments);
      }

      PinnedElementView.prototype.initialize = function() {
        Backbone.Validation.bind(this);
        return this.render();
      };

      PinnedElementView.prototype.remove = function() {
        return Backbone.Validation.unbind(this);
      };

      PinnedElementView.prototype.render = function() {
        var template, variables;
        variables = {
          title: this.model.attributes.title,
          content: this.model.attributes.content
        };
        template = _.template($('#pinboard_element_template').html(), variables);
        $('#pinboard_body').append(template);
        return $(".draggable").draggable({
          snap: true,
          stack: ".draggable"
        });
      };

      return PinnedElementView;

    })(Backbone.View);
  });

}).call(this);

//# sourceMappingURL=PinnedElementView.map
