class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    api_key = params[:post].delete(:api_key)

    @post = Post.new(params[:post])
    @user = User.find(@post.user_id)

    if @post.save! && api_key == @user.api_key

      flash[:notice] = "Thanks for posting!"

      if @post.tags.count != 0 && @post.tags.last.name == ""
        @post.tags.last.destroy
      end

      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render :json => @post }
      end
    else
      respond_to do |format|
        format.json { render :json => "You are not logged in" }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new

    return_json = {:post => @post, :comments => @post.comments, :tags => @post.tags}

    respond_to do |format|
      format.html { render :show }
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

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json
    end
  end
end
