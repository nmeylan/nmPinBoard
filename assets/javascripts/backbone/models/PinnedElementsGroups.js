// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.PinnedElementsGroups = (function(_super) {
    __extends(PinnedElementsGroups, _super);

    function PinnedElementsGroups() {
      return PinnedElementsGroups.__super__.constructor.apply(this, arguments);
    }

    PinnedElementsGroups.prototype.model = PinnedElementsGroup;

    PinnedElementsGroups.prototype.initialize = function() {
      return console.log("Pinned elements groups collection constructor");
    };

    return PinnedElementsGroups;

  })(Backbone.Collection);

}).call(this);
