class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user
      @user.session_token = SecureRandom.base64
      session[:session_token] = @user.session_token
      @user.save!
      redirect_to posts_path
    else
      render 'session/new'
    end
  end

  def destroy
    @user = User.find_by_session_token(session[:session_token])

    session[:session_token] = nil
    @user.session_token = nil
    @user.save

    redirect_to posts_path
  end
end
