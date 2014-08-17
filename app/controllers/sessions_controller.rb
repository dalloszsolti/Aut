class SessionsController < ApplicationController
 
  def new  
  end  
  
  def create  
    user = User.find_by_email(params[:email])  
      if user && user.authenticate(params[:password])  
        session[:user_id] = user.id  
        redirect_to root_url
        flash[:notice] = 'Sikeres bejelentkezés!'  
      else  
        flash.now.alert = "Érvénytelen bejelentkezési adatok!"  
        render "new"  
      end  
  end
  
  
  def destroy  
    session[:user_id] = nil  
    redirect_to root_url
    flash[:notice] = 'Sikeres kijelentkezés!'  
  end  
end 