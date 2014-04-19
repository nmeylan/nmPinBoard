window.nmPinBoard = {}

$.fn.single_double_click = (single_click_callback, double_click_callback, timeout) ->
  this.each() ->
    clicks = 0
    self = this;
    $(this).click(event) ->
      clicks += 1
      if clicks == 1
        setTimeout (->
          if clicks == 1
            single_click_callback.call(self, event)
          else
            double_click_callback.call(self, event)
          clicks = 0 ), timeout || 300

S4 = ->
  (((1+Math.random())*0x10000)|0).toString(16).substring(1)

nmPinBoard.guid = ->
  (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4())
