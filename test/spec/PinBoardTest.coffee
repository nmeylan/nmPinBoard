describe "Pin board Test", ->
  pinBoardView = undefined

  beforeEach ->
    pinBoardView = new nmPinBoard.PinBoardView({
      model : new nmPinBoard.PinBoard()
    })

  describe "Create new PinBoard", ->
    it "Success", ->
      expect(pinBoardView.model).toBeDefined()
    it "Default id", ->
      expect(pinBoardView.model.get("id")).toEqual(-1)

  describe "Use validation", ->
    it "Validate title can't be blank", ->
      pinBoardView.model.set({'title': ''}, {validate : true})
      expect(pinBoardView.model.isValid()).toBeFalsy()
    it "Validate descrition can't be blank", ->
      pinBoardView.model.set({'description': ''}, {validate : true})
      expect(pinBoardView.model.isValid()).toBeFalsy()


  afterEach ->
    pinBoardView = undefined