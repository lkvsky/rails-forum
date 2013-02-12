class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.save!
    flash[:notice] = "Thanks for posting!"

    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def index
    @posts = Post.all.reverse
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
end
