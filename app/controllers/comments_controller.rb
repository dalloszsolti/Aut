class CommentsController < ApplicationController
  def create
	@topic = Topic.find(params[:topic_id])
	@comment = @topic.comments.create(params[:comment])
	@comment.user_id = session[:user_id]
	
	if @comment.save  
	  event_logger ("New comment saved successfully")
	  redirect_to topic_path(@topic)
	  flash[:notice] = 'Sikeres hozzászólás!'  
	else  
	  event_logger ("Error while trying to save new comment")
	  render "topics/show" 
	end  
	
  end
end