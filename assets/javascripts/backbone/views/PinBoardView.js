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

      PinBoardView.prototype.initialize = function() {
        return Backbone.Validation.bind(this);
      };

      PinBoardView.prototype.remove = function() {
        return Backbone.Validation.unbind(this);
      };

      return PinBoardView;

    })(Backbone.View);
  });

}).call(this);
