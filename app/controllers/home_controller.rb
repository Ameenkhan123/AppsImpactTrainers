class HomeController < ApplicationController
	layout 'imapact_fornthand'
	def index
		session[:conversations] ||= []

		@users = User.all
		@conversations = Conversation.includes(:recipient, :chats)
		.find(session[:conversations])
	end

	def show
		@chats = Chat.all
	end
end
