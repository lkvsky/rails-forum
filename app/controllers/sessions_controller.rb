class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user
      @user.api_key = SecureRandom.urlsafe_base64
      session[:api_key] = @user.api_key
      @user.save!

      respond_to do |format|
        format.html { redirect_to posts_path }
        format.json { render :json => @user }
      end
    else
      render 'session/new'
    end
  end

  def show
    respond_to do |format|
      format.json
    end
  end

  def destroy
    @user = User.find_by_api_key(session[:api_key])
    flash[:notice] = "Bye, #{@user.name}"

    session[:api_key] = nil
    @user.api_key = nil
    @user.save

    redirect_to new_session_path
  end
end
