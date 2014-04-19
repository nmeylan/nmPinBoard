// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  jQuery(function() {
    return nmPinBoard.PinBoardView = (function(_super) {
      __extends(PinBoardView, _super);

      function PinBoardView() {
        return PinBoardView.__super__.constructor.apply(this, arguments);
      }

      PinBoardView.prototype.el = $('body');

      PinBoardView.prototype.elTitleId = '#pinboard_title';

      PinBoardView.prototype.elEditTitleId = "#edit_pinboard_title";

      PinBoardView.prototype.elDescriptionId = '#pinboard_description';

      PinBoardView.prototype.elEditDescriptionId = "#edit_pinboard_description";

      PinBoardView.prototype.elAddId = '#add_element';

      PinBoardView.prototype.pinnedElementViews = [];

      PinBoardView.prototype.initialize = function() {
        Backbone.Validation.bind(this);
        return this.render();
      };

      PinBoardView.prototype.remove = function() {
        return Backbone.Validation.unbind(this);
      };

      PinBoardView.prototype.render = function() {
        this.renderHeader();
        return this.renderBody();
      };

      PinBoardView.prototype.renderHeader = function() {
        var template, variables;
        variables = {
          title: this.model.attributes.title,
          description: this.model.attributes.description
        };
        template = _.template($('#pinboard_header_template').html(), variables);
        return $('#pinboard_header').html(template);
      };

      PinBoardView.prototype.renderBody = function() {
        return $("#pinboard_body").selectable();
      };

      PinBoardView.prototype.events = {
        'click #add_element': 'doAddElement',
        'dblclick #pinboard_title': 'doEditTitle',
        'blur #pinboard_title': 'doUpdateTitle',
        'dblclick #pinboard_description': 'doEditDescription',
        'blur #pinboard_description': 'doUpdateDescription'
      };

      PinBoardView.prototype.doAddElement = function() {
        var view;
        view = new nmPinBoard.PinnedElementView({
          model: new nmPinBoard.PinnedElement()
        });
        this.pinnedElementViews.push(view);
        return this.model.elements.push(view.model);
      };

      PinBoardView.prototype.doEditTitle = function() {
        return this.doEdit(this.elTitleId, this.elEditTitleId);
      };

      PinBoardView.prototype.doUpdateTitle = function() {
        return this.doUpdate(this.elTitleId, 'title');
      };

      PinBoardView.prototype.doEditDescription = function() {
        return this.doEdit(this.elDescriptionId, this.elEditDescriptionId);
      };

      PinBoardView.prototype.doUpdateDescription = function() {
        return this.doUpdate(this.elDescriptionId, 'description');
      };

      PinBoardView.prototype.doEdit = function(elementId, elementInputId) {
        var element, input;
        element = $(elementId);
        if (!element.hasClass("editing")) {
          element.html("<input type='textfield' id='" + elementInputId + "' value='" + element.text() + "' class='edit_header'/>");
          input = element.children()[0];
          input.selectionStart = input.selectionEnd = input.value.length;
          return element.addClass('editing');
        }
      };

      PinBoardView.prototype.doUpdate = function(elementId, attribute) {
        var element, old, val;
        element = $(elementId);
        if (element.hasClass("editing")) {
          val = element.children()[0].value;
          old = this.model.attributes[attribute];
          this.model.attributes[attribute] = val;
          this.model.validate();
          if (this.model.isValid(true)) {
            element.html(this.model.attributes[attribute]);
          } else {
            element.html(old);
          }
          return element.removeClass('editing');
        }
      };

      return PinBoardView;

    })(Backbone.View);
  });

}).call(this);

//# sourceMappingURL=PinBoardView.map
