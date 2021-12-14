$(function() {
  $('.input-submit').hide();
  $('#room_message_message').on('input', function() {
    console.log($(this).val().trim());
    if ($(this).val().trim() == '')
      $('.input-submit').hide();
    else
      $('.input-submit').show();
  })

  $('#new_room_message').on('ajax:success', function() {
    $(this).find('input[type="text"]').val('');
  });
});

function reload() {
  setTimeout(() => {
    location.reload()
  }, 0)
}