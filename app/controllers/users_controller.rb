class UsersController < ApplicationController
  def index
    if current_user.id == 1
      @users = User.page(params[:page]).per(10)
    else
      redirect_to("/")
    end
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.order("created_at DESC").page(params[:page]).per(10)
    @favorites = @user.inventories.order("created_at DESC").page(params[:page]).per(10)
  end

end
