class UsersController < ApplicationController
  def index
    if current_user.id == 1
      @users = User.page(params[:page]).per(10)
    else
      redirect_to("/")
    end
  end

  def show
    if current_user.id == 1
      @user = User.find(params[:id])
    end
  else
    redirect_to("/")
  end
end
