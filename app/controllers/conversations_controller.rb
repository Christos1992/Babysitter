class ConversationsController < ApplicationController

def new

	@conversation = Conversation.create!
end

def index
 @users = User.all
 @conversations = Conversation.all
 end

def create
 if Conversation.between(params[:parent_id],params[:bbsitter_id])
   .present?
    @conversation = Conversation.between(params[:parent_id],
     params[:bbsitter_id]).first
 else
  @conversation = Conversation.create!(conversation_params)
 end

 redirect_to conversation_messages_path(@conversation)

end
	private
  def convarsations_params
   params.require(:conversation).permit(:parent_id, :bbsitter_id)
  end


end
