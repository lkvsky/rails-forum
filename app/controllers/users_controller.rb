class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      @user.api_key = SecureRandom.urlsafe_base64
      session[:api_key] = @user.api_key
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])

    user_posts = @user.posts.map do |post|
      post = {:post => post, :comments => post.comments, :tags => post.tags}
    end

    return_hash = {
      :user => @user,
      :posts => user_posts
    }

    respond_to do |format|
      format.html { render :show }
      format.json { render :json => return_hash }
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to posts_path
  end
end
