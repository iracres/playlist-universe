class UsersController < ApplicationController

  skip_before_action :require_login, only: [:create]

  def create
    @user = User.new(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], password: params[:user][:password])
    
    if @user.save
      puts "SUCCESSFULLY CREATED USER"
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"

    else
      puts "FAILURE TO CREATE"
      flash[:errors] = @user.errors.full_messages
      redirect_to '/sessions/new'
    end
  end

  def view
    @user = User.find(params[:id])
  end


end
