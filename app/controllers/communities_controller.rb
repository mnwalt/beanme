class CommunitiesController < ApplicationController
  def index
    @reviews = current_user.timeline_reviews.order("created_at DESC").page(params[:page]).per(10)

    @favorites = current_user.timeline_favorites.order("created_at DESC").page(params[:page]).per(10)

    @stories = Story.all.order("created_at DESC").page(params[:page]).per(10)
  end




end
