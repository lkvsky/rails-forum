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

    return_json = {:post => @post, :comments => @post.comments, :tags => @post.tags}

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => return_json }
    end
  end

  def index
    @posts = Post.all.reverse
    @post = Post.new
    @post.tags.build

    return_hash = {}
    @posts.each do |post|
      return_hash[post.id] = {:post => post,
                     :comments => post.comments,
                     :tags => post.tags}
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => return_hash }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
end
