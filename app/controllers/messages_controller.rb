class MessagesController < ApplicationController
    before_action :set_conversation

    def create

      receipt = current_user.reply_to_conversation(@conversation, params['body'])
      redirect_to conversation_path(receipt.conversation)
    end

    def destroy
      message = @conversation.receipts.find(params[:id]).message
      if message.destroy
        flash[:notice] = 'successfully deleted'
      end
      redirect_to conversations_path
    end

  private

    def set_conversation
      @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
    end
end
