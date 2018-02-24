class ConversationsController < ApplicationController

  def index
    @conversations = current_user.mailbox.conversations.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @recipient = User.find(params[:recipient])
  end

  def create
    recipient = User.find(params[:format])
    receipt = current_user.send_message(recipient, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end

end
