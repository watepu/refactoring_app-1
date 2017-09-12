ready = ->
  $(window).scroll ->
    element = $('#page-top-btn2')
    visible = element.is(':visible')
    height = $(window).scrollTop()
    console.log(height);
    if height > 1000
      element.fadeIn() if !visible
    else
      element.fadeOut()
  $(document).on 'click', '#move-page-top2', ->
    $('html, body').animate({ scrollTop: 0 }, 'slow')

$(document).ready(ready)
$(document).on('page:load', ready)
