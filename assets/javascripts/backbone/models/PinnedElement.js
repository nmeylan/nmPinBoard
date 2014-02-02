// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.PinnedElement = (function(_super) {
    __extends(PinnedElement, _super);

    function PinnedElement() {
      return PinnedElement.__super__.constructor.apply(this, arguments);
    }

    PinnedElement.prototype.defaults = {
      id: -1,
      title: "Your pinned element title",
      content: "Content of your element",
      created_on: Date.now(),
      updated_on: Date.now(),
      group_id: -1
    };

    PinnedElement.prototype.initialize = function() {
      return console.log('Pinned element Constructor');
    };

    return PinnedElement;

  })(Backbone.Model);

}).call(this);
