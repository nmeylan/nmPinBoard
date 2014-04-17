// Generated by CoffeeScript 1.7.1
(function() {
  describe("Pin board Test", function() {
    var pinBoardView;
    pinBoardView = void 0;
    beforeEach(function() {
      return pinBoardView = new nmPinBoard.PinBoardView({
        model: new nmPinBoard.PinBoard()
      });
    });
    describe("Create new PinBoard", function() {
      it("Success", function() {
        return expect(pinBoardView.model).toBeDefined();
      });
      return it("Default id", function() {
        return expect(pinBoardView.model.get("id")).toEqual(-1);
      });
    });
    describe("Use validation", function() {
      it("Validate title can't be blank", function() {
        pinBoardView.model.set({
          'title': ''
        }, {
          validate: true
        });
        return expect(pinBoardView.model.isValid()).toBeFalsy();
      });
      return it("Validate descrition can't be blank", function() {
        pinBoardView.model.set({
          'description': ''
        }, {
          validate: true
        });
        return expect(pinBoardView.model.isValid()).toBeFalsy();
      });
    });
    return afterEach(function() {
      return pinBoardView = void 0;
    });
  });

}).call(this);

//# sourceMappingURL=PinBoardTest.map
