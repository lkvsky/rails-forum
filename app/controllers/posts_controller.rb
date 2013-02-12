class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    params[:post][:tag_ids].last.delete

    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Thanks for posting!"
      redirect_to root_path
    elsif @post.tag_ids.last.name == ''
      @post.tag_ids.last.destroy
    end

  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def index
    @posts = Post.all.reverse
    @post = Post.new
    @post.tags.build
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
end
