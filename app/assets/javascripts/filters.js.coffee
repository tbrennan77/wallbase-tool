$ ->
  $('select').hide()
  $('.single-parent').hide()

  $("#addLink").live 'click', ->
    if $('#addLink').attr("disabled") != "disabled"
      $('form#sampleCart').submit()

  appear_class = 'fadeInRightBig'
  disappear_class = 'fadeOutLeftBig'

  $('form.details-form').live 'change', ->
    if $(this).find('select').val() != ""
      $(this).submit()
      $('.result-parent').removeClass(appear_class).addClass(disappear_class)
      $('.single-parent').removeClass(disappear_class).addClass(appear_class).show()
      $('.result-parent').fadeOut()

  $('.back-to-filter').live 'click', ->  
    $('form#search-form').submit()
    $('.single-parent').removeClass(appear_class).addClass(disappear_class)
    $('.result-parent').removeClass(disappear_class).addClass(appear_class).show()
    $('.single-parent').fadeOut()

  if IpadIsNotStandalone()
    DisplayAddToHomeScreenPopup()

  $('form#search-form').live 'change', ->
    $(this).submit()

  updateCount = ->
    count = $('#selectedColors').children().length-1
    word = 'samples'
    if count == 1
      word = 'sample'

    $('#addLink').text('Add ' + count + ' ' + word + ' to cart')
    if count == 0
      $('#addLink').attr("disabled", "disabled")
    else
      $('#addLink').removeAttr("disabled")

  $('label.color-label').live 'change', ->
    count      = $('#selectedColors').children().length-1
    sku        = $(this).find('input').data('sku')
    name       = $(this).find('input').val()
    color      = $(this).data('color')
    is_checked = $(this).find('input').is(':checked')

    if count < 8      
      if is_checked
        $(this).addClass('active')
        $('#selectedColors').append('<li><label style="background: #EFEFEF; color: #333">'+name+'<input type="hidden" name="wallbase_skus[]" value="'+sku+'" checked="checked" /></label></li> ')
      else
        $(this).removeClass('active');
        $('#selectedColors li').find('input[value="'+sku+'"]').parent().parent().remove();        
    else if !is_checked      
        $(this).removeClass('active');
        $('#selectedColors li').find('input[value="'+sku+'"]').parent().parent().remove();
    
    updateCount()

  $('#reset').live 'click', ->
    window.location = '/'

  $('#notification-close').live 'click', ->
    $('#samplecart-results').fadeOut()