﻿class PasswordResetsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => "A megadott email címre megküldtük a jelszó megújításához szükséges adatokat."
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 12.hours.ago
    redirect_to new_password_reset_path, :alert => "Password &crarr; 
      reset has expired."
  elsif @user.update_attributes(params[:user])
    redirect_to root_url, :notice => "A jelszó megújításra került"
  else
    render :edit
  end
end

end
