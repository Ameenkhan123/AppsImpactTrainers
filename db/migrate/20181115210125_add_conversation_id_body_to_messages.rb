class AddConversationIdBodyToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :conversation, foreign_key: true
    add_column :messages, :body, :text
  end
end
