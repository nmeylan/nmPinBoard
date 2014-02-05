describe "Pinned element test", ->
  pinnedElementView = undefined
  pinnedElements = undefined

  beforeEach ->
    pinnedElementView = new nmPinBoard.PinnedElementView({
      model : new nmPinBoard.PinnedElement()
    })

  describe "Create new Pinned element", ->
    it "Success", ->
      expect(pinnedElementView.model).toBeDefined()
    it "Default id", ->
      expect(pinnedElementView.model.get("id")).toEqual(-1)

  describe "Use validation on attributes", ->
    it "Validate title can't be blank", ->
      pinnedElementView.model.set({'title': ''}, {validate : true})
      expect(pinnedElementView.model.isValid()).toBeFalsy()
    it "Validate content can't be blank", ->
      pinnedElementView.model.set({'content': ''}, {validate : true})
      expect(pinnedElementView.model.isValid()).toBeFalsy()

  describe "Use validation on customization", ->
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


  describe "Collection tests", ->
    beforeEach ->
      pinnedElements = new nmPinBoard.PinnedElements()
      pinnedElements.add(pinnedElementView.model)
    describe "Use collection basics operations", ->
      it "Add element", ->
        expect(pinnedElements.length).toBeGreaterThan(0)
      it "Remove element", ->
        pinnedElements.remove(pinnedElementView.model)
        expect(pinnedElements.length).toEqual(0)
      it "Update and retrieve element", ->
        pinnedElementView.model.set({id : 666})
        expect(pinnedElements.get(666)).toBeDefined()
        expect(pinnedElements.get(667)).not.toBeDefined()

    describe "Use collection persistence operations", ->
      beforeEach ->
        pinnedElementView.model.set({id : 666, title : "MY FUCKING TITLE"})
        for e in pinnedElements.models
          e.save()
      it "Fetch persisted elements", ->
          #Drop list's elements
        pinnedElements.reset()
        expect(pinnedElements.length).toEqual(0)
        #Fill list with persisted elements
        pinnedElements.fetch()
        expect(pinnedElements.length).toBeGreaterThan(0)
        expect(pinnedElements.get(666)).toBeDefined()
      it "Remove persisted elements", ->
        expect(pinnedElements.length).toBeGreaterThan(0)
        expect(pinnedElements.get(666)).toBeDefined()
        for e in pinnedElements.models
          e.destroy()
        expect(pinnedElements.length).toEqual(0)
        expect(pinnedElements.get(666)).not.toBeDefined()
      it "Try to persisted unvalidate element fail!", ->
        pinnedElementView.model.set({title : ""})
        pinnedElementView.model.save()
        expect(pinnedElementView.model.isValid()).toBeFalsy()
      afterEach ->
        for e in pinnedElements.models
          e.destroy()
    afterEach ->
      pinnedElementView = undefined
      pinnedElements = undefined
