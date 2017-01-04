class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.blank?
    @users = @q.result.order("created_at DESC").page(params[:page]).per(25)

    render("users/index.html.erb")
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.order("created_at DESC").page(params[:page]).per(10)
    @favorites = @user.inventories.order("created_at DESC").page(params[:page]).per(10)
  end

end
