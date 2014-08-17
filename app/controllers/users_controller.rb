﻿class UsersController < ApplicationController
  
  def new
    @user = User.new 
    event_logger ("New user method called")
  end


  def create  
    @user = User.new(params[:user])  
    
    if @user.save  
      event_logger ("New user saved successfully with the following details:\n"+"Email address: "+@user.email)
      redirect_to root_url
      flash[:notice] = 'Sikeresen feliratkozott!'  
    else  
      event_logger ("Error while trying to save new user")
      render "new"  
    end  
  end  


  def index
    @users=User.all
    #User.find_by_role("member")
    event_logger ("User list displayed")
  end

  def show
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(@user)
      flash[:notice] = 'A felhasználó adatai sikeresen frissítésre kerültek!'
      else
       render :action => "edit"
      end
  end


  def destroy
      @user = User.find(params[:id])
      @user.destroy
      event_logger ("User deleted successfully")
      redirect_to users_url
      flash[:notice] = 'A felhasználó adatai sikeresen törlésre kerültek!'
  end


  def edit
    @user = User.find(params[:id])
  end

end
