App.conversation = App.cable.subscriptions.create("ConversationChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    var conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");

    if (data['window'] !== undefined) {
      var conversation_visible = conversation.is(':visible');

      if (conversation_visible) {
        var chats_visible = (conversation).find('.panel-body').is(':visible');

        if (!chats_visible) {
          conversation.removeClass('panel-default').addClass('panel-success');
        }
        conversation.find('.chats-list').find('ul').append(data['chat']);
      }
      else {
        $('#conversations-list').append(data['window']);
        conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
        conversation.find('.panel-body').toggle();
      }
    }
    else {
      conversation.find('ul').append(data['chat']);
    }

    var chats_list = conversation.find('.chats-list');
    var height = chats_list[0].scrollHeight;
    chats_list.scrollTop(height);
  },
  speak: function(chat) {
    return this.perform('speak', {
      chat: chat
    });
  }
});
$(document).on('submit', '.new_chat', function(e) {
  e.preventDefault();
  var values = $(this).serializeArray();
  App.conversation.speak(values);
  $(this).trigger('reset');
});
