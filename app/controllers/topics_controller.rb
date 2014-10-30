class TopicsController < ApplicationController
  
  def new
	@topic = Topic.new 
	event_logger ("New topic method called")
  end


  def create  
	@topic = Topic.new(params[:topic])
	@topic.active = true
	@topic.user_id = session[:user_id]
	
	if @topic.save  
	  event_logger ("New topic saved successfully")
	  redirect_to topics_url
	  flash[:notice] = 'Sikeresen létrehozta a topikot!'  
	else  
	  event_logger ("Error while trying to save new topic")
	  render "new"  
	end  
  end  

  def index
	if current_user and current_user.role == "admin"
	  @topics=Topic.unscoped.all
	else
	  @topics=Topic.active
   end 
	event_logger ("Topic list displayed")
  end

  def show
	@topic = Topic.find(params[:id])
  end

  def update
	@topic = Topic.find(params[:id])
	if @topic.update_attributes(params[:topic])
	  redirect_to(@topic)
	  flash[:notice] = 'A topik adatai sikeresen frissítésre kerültek!'
	  else
	   render :action => "edit"
	  end
  end

  def destroy
	  @topic = Topic.find(params[:id])
	  @topic.destroy
	  event_logger ("Topic deleted successfully")
	  redirect_to topics_url
	  flash[:notice] = 'A topik datai sikeresen törlésre kerültek!'
  end

  def edit
	@topic = Topic.find(params[:id])
  end

end