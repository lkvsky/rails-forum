class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      post = Post.find(@comment.post_id)
      redirect_to post_path(post)
    else
      render 'new'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = Post.find(comment.post_id)

    comment.destroy

    redirect_to post_path(post)
  end
end
