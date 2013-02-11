class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.save!

    redirect_to users_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to posts_path
  end
end
