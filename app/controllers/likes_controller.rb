class LikesController < ApplicationController
  before_action :current_user_must_be_like_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_like_user
    like = Like.find(params[:id])

    unless current_user == like.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    if current_user.id == 1
      @likes = Like.all

      render("likes/index.html.erb")
    else
      redirect_to("/")
    end
  end

  def show
    if current_user.id == 1
      @like = Like.find(params[:id])

      render("likes/show.html.erb")
    else
      redirect_to("/")
    end
  end

  def new
    @like = Like.new

    render("likes/new.html.erb")
  end

  def create
    @like = Like.new

    @like.user_id = params[:user_id]
    @like.review_id = params[:review_id]

    save_status = @like.save

    if save_status == true
        redirect_to(:back, :notice => "Like created.")
      else
      redirect_to(:back)
    end
  end

  def edit
    @like = Like.find(params[:id])

    render("likes/edit.html.erb")
  end

  def update
    @like = Like.find(params[:id])

    @like.user_id = params[:user_id]
    @like.review_id = params[:review_id]

    save_status = @like.save

    if save_status == true
      redirect_to("/likes/#{@like.id}", :notice => "Like updated successfully.")
    else
      render("likes/edit.html.erb")
    end
  end

  def destroy
    @like = Like.find(params[:id])

    @like.destroy

    redirect_to(:back, :notice => "Like deleted.")
  end
  end
