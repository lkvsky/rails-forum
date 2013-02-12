class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    api_key = params[:comment].delete(:api_key)

    @comment = Comment.new(params[:comment])
    @user = User.find(@comment.user_id)

    if @comment.save && api_key == @user.api_key
      post = Post.find(@comment.post_id)

      respond_to do |format|
        format.html { redirect_to post_path(post) }
        format.json { render :json => @comment }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render :json => "You're not logged in" }
      end
    end
  end

  def show
  end

  def destroy
    comment = Comment.find(params[:id])
    post = Post.find(comment.post_id)

    comment.destroy

    redirect_to post_path(post)
  end
end
