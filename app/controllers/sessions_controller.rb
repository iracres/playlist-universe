class SessionsController < ApplicationController

  skip_before_action :require_login, except: [:destroy]

  def new
    #render the login page
  end

  def create
    puts "Attempt Login"
    @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    puts params[:user]

    if @user 
      puts "LOGIN SUCCESSFUL"
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"  
    else
      puts "LOGIN FAILURE"
      flash[:errors] = ["Invalid Login"]
      redirect_to '/sessions/new'
  end
end

  def destroy
    reset_session
    flash[:errors] = ["Sad to see you go!"]
    redirect_to '/sessions/new'
  end
end
