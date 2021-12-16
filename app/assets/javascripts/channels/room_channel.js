$(function() {
  $('[data-channel-subscribe="room"]').each(function(index, element) {
    let $element = $(element),
        room_id = $element.data('room-id')
        messageTemplate = $('[data-role="message-template"]');

    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)        

    App.cable.subscriptions.create(
      {
        channel: "RoomChannel",
        room: room_id
      },
      {
        received: function(data) {
          let content = messageTemplate.children().clone(true, true);
          content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
          content.find('[data-role="message-text"]').text(data.message);
          content.find('[data-role="message-date"]').text(data.updated_at);
          content.find('[data-role="user-name"]').text(data.user_name);
          current_user_id = $("#navbarDropdown").attr('data-currentId');
          if (current_user_id == data.user_id)
            content.find('[data-role="message-row"]').addClass('current-user');
          $element.append(content);
          $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
        }
      }
    );
  });
});