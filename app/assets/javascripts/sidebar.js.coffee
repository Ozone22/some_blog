ready = ->

  $('#collapse').on('shown.bs.collapse', () ->
    $("#down_arrow").removeClass("fa-angle-down").addClass("fa-angle-up")
    return
  )

  $('#collapse').on('hidden.bs.collapse', () ->
    $("#down_arrow").removeClass("fa-angle-up").addClass("fa-angle-down")
    return
  )

$(document).ready(ready)
$(document).on('page:load', ready)