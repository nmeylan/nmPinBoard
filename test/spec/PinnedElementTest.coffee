describe "Pinned element test", ->
  pinnedElementView = undefined

  beforeEach ->
    pinnedElementView = new nmPinBoard.PinnedElementView({
      model : new nmPinBoard.PinnedElement()
    })

  describe "Create new Pinned element", ->
    it "Success", ->
      expect(pinnedElementView.model).toBeDefined()
    it "Default id", ->
      expect(pinnedElementView.model.get("id")).toEqual(-1)

  describe "Use validation", ->
    it "Validate title can't be blank", ->
      pinnedElementView.model.set({'title': ''}, {validate : true})
      expect(pinnedElementView.model.isValid()).toBeFalsy()
    it "Validate content can't be blank", ->
      pinnedElementView.model.set({'content': ''}, {validate : true})
      expect(pinnedElementView.model.isValid()).toBeFalsy()
    it "Validate positionX not a number", ->
      custo = pinnedElementView.model.get("customization")
      custo.set({"position" : {offsetX : "ff", offsetY : 0}}, {validate : true})
      pinnedElementView.model.set("customization" : custo, {validate : true})
      expect(pinnedElementView.model.isValid()).toBeFalsy()
    it "Validate positionY not a number", ->
      custo = pinnedElementView.model.get("customization")
      custo.set({"position" : {offsetX : 50, offsetY : "ff"}}, {validate : true})
      pinnedElementView.model.set("customization" : custo, {validate : true})
      expect(pinnedElementView.model.isValid()).toBeFalsy()
    it "Validate color can't be blank", ->
      custo = pinnedElementView.model.get("customization")
      custo.set({"color" : ' '}, {validate : true})
      pinnedElementView.model.set("customization" : custo, {validate : true})
      expect(pinnedElementView.model.isValid()).toBeFalsy()
    it "Validate opacity not a number", ->
      custo = pinnedElementView.model.get("customization")
      custo.set({"opacity" : 'gg'}, {validate : true})
      pinnedElementView.model.set("customization" : custo, {validate : true})
      expect(pinnedElementView.model.isValid()).toBeFalsy()
    it "Validate opacity not in range > 1", ->
      custo = pinnedElementView.model.get("customization")
      custo.set({"opacity" : 1.2}, {validate : true})
      pinnedElementView.model.set("customization" : custo, {validate : true})
      expect(pinnedElementView.model.isValid()).toBeFalsy()
    it "Validate opacity not in range < 0", ->
      custo = pinnedElementView.model.get("customization")
      custo.set({"opacity" : -0.01}, {validate : true})
      pinnedElementView.model.set("customization" : custo, {validate : true})
      expect(pinnedElementView.model.isValid()).toBeFalsy()


  afterEach ->
    pinnedElementView = undefined