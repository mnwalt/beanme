class ResponsesController < ApplicationController
  before_action :current_user_must_be_response_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_response_user
    response = Response.find(params[:id])

    unless current_user == response.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    if current_user.id == 1
      @s = response.all

      render("responses/index.html.erb")
    else
      redirect_to("/")
    end
  end

  def show
    if current_user.id == 1
      @response = response.find(params[:id])

      render("responses/show.html.erb")
    else
      redirect_to("/")
    end
  end

  def new
    @response = Response.new

    render("responses/new.html.erb")
  end

  def create
    @response = Response.new

    @response.review_id = params[:review_id]
    @response.body = params[:body]
    @response.user_id = params[:user_id]

    save_status = @response.save

    if save_status == true
      redirect_to(:back, :notice => "Comment created.")
    else
    redirect_to(:back)
  end
  end

  def edit
    @response = response.find(params[:id])

    render("responses/edit.html.erb")
  end

  def update
    @response = response.find(params[:id])

    @response.review_id = params[:review_id]
    @response.body = params[:body]
    @response.user_id = params[:user_id]

    save_status = @response.save

    if save_status == true
      redirect_to("/responses/#{@response.id}", :notice => "response updated successfully.")
    else
      render("responses/edit.html.erb")
    end
  end

  def destroy
    @response = response.find(params[:id])

    @response.destroy

    redirect_to(:back, :notice => "Comment deleted.")
  end
end
