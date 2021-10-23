class SongsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @songs = Song.all
    #shows the index page
  end

  def create
    Song.create(title: params[:song][:title], artist: params[:song][:artist])
    redirect_to '/songs'
  end

  def show
    @song = Song.find(params[:id])

    #display the show page
  end
  
  def add 
    @user = User.find(session[:user_id])
    @song = Song.find(params[:id])
    @user.songs<<@song
    redirect_to "/users/#{@user.id}"
  end
end
