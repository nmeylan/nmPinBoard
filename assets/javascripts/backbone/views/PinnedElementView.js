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

      PinnedElementView.prototype.el = $('body');

      PinnedElementView.prototype.initialize = function() {
        return Backbone.Validation.bind(this);
      };

      PinnedElementView.prototype.remove = function() {
        return Backbone.Validation.unbind(this);
      };

      return PinnedElementView;

    })(Backbone.View);
  });

}).call(this);