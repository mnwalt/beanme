class FriendRequestsController < ApplicationController

  def index
    @q = User.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.blank?
    @users = @q.result.order("created_at DESC").page(params[:page]).per(10)

    render("friend_requests/index.html.erb")
  end

  def show
    if current_user.id == 1
      @friend_request = FriendRequest.find(params[:id])

      render("friend_requests/show.html.erb")
    else
      redirect_to("/")
    end
  end

  def new
    @friend_request = FriendRequest.new

    render("friend_requests/new.html.erb")
  end

  def create
    @friend_request = FriendRequest.new

    @friend_request.sender_id = params[:sender_id]
    @friend_request.receiver_id = params[:receiver_id]
    @friend_request.status = "Y"

    save_status = @friend_request.save

    if save_status == true
        redirect_to(:back, :notice => "Friendship created.")
      else
      redirect_to(:back)
    end
  end

  def edit
    @friend_request = FriendRequest.find(params[:id])

    render("friend_requests/edit.html.erb")
  end

  def update
    @friend_request = FriendRequest.find(params[:id])

    @friend_request.sender_id = params[:sender_id]
    @friend_request.receiver_id = params[:receiver_id]
    @friend_request.status = "Y"

    save_status = @friend_request.save

    if save_status == true
      redirect_to("/friend_requests/#{@friend_request.id}", :notice => "Friendship updated successfully.")
    else
      render("friend_requests/edit.html.erb")
    end
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])

    @friend_request.destroy

    redirect_to(:back, :notice => "Friendship deleted.")
  end
  end
