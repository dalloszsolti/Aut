class ApplicationController < ActionController::Base

protect_from_forgery


# Private logging method to record log events in separate file

def event_logger (msg)
  f = File.open("event.log", "a")
  f.puts Time.now.strftime("%Y / %m / %d %H:%M:%S") + "  :  " + msg
  f.close
end

 
 private  
  
 def current_user  
      @current_user = @current_user || User.find(session[:user_id]) if session[:user_id]  
 end  




helper_method :event_logger
helper_method :current_user

end
