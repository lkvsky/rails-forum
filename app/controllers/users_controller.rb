class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.save!

    redirect_to users_path(@user)
  end
end
