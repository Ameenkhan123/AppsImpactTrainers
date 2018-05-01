# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations-#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    chat_params = data['chat'].each_with_object({}) do |el, hash|
      hash[el.values.first] = el.values.last
    end

    Chat.create(chat_params)
  end
end
