class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.save!

    redirect_to posts_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.reverse
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
end
