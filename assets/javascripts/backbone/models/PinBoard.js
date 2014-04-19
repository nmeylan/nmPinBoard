// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  nmPinBoard.PinBoard = (function(_super) {
    __extends(PinBoard, _super);

    function PinBoard() {
      return PinBoard.__super__.constructor.apply(this, arguments);
    }

    PinBoard.prototype.defaults = {
      id: -1,
      title: "Your pin board title",
      description: "A short description for your pin board",
      created_on: Date.now(),
      updated_on: Date.now(),
      owner_id: -1,
      elements: {}
    };

    PinBoard.prototype.validation = {
      title: {
        required: true | false,
        msg: "Title can't be blank"
      },
      description: {
        required: true | false,
        msg: "Description can't be blank"
      }
    };

    PinBoard.prototype.initialize = function() {
      return this.elements = new nmPinBoard.PinnedElements();
    };

    PinBoard.prototype.validate = function() {
      return PinBoard.__super__.validate.call(this);
    };

    return PinBoard;

  })(Backbone.Model);

}).call(this);

//# sourceMappingURL=PinBoard.map
