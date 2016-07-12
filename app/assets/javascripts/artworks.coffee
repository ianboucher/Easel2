# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  Sortable.create draggableList,
    scroll: true
    handle: '.ion-arrow-move'
    animation: 150
    draggable: '.list-group-item'

    onEnd: (e) ->
      console.log(e)
      itemId = e.item.id.split(/_/)[1]
      $.ajax
        url: "/images/#{itemId}"
        method: 'patch'
        dataType: 'json'
        data:
          image : {  position: e.newIndex + 1 }
