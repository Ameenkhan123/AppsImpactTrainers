class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    # ActionCable.server.broadcast 'room_channel', render_chat(chat, chat.user)
    sender = chat.user
    recipient = chat.conversation.opposed_user(sender)

    broadcast_to_sender(sender, chat)
    broadcast_to_recipient(recipient, chat)
  end

  private

  def broadcast_to_sender(user, chat)
    ActionCable.server.broadcast(
      "conversations-#{user.id}",
      chat: render_chat(chat, user),
      conversation_id: chat.conversation_id
    )
  end

  def broadcast_to_recipient(user, chat)
    ActionCable.server.broadcast(
      "conversations-#{user.id}",
      window: render_window(chat.conversation, user),
      chat: render_chat(chat, user),
      conversation_id: chat.conversation_id
    )
  end

  def render_chat(chat, user)
    ApplicationController.render(
      partial: 'chats/chat',
      locals: { chat: chat, user: user }
    )
  end

  def render_window(conversation, user)
    ApplicationController.render(
      partial: 'conversations/conversation',
      locals: { conversation: conversation, user: user }
    )
  end

end
