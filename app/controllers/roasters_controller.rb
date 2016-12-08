class RoastersController < ApplicationController
  def index
    @q = Roaster.ransack(params[:q])
    @roasters = @q.result(:distinct => true).includes(:beans, :reviews).page(params[:page]).per(12)
    @location_hash = Gmaps4rails.build_markers(@roasters.where.not(:location_latitude => nil)) do |roaster, marker|
      marker.lat roaster.location_latitude
      marker.lng roaster.location_longitude
      marker.infowindow "<h5><a href='/roasters/#{roaster.id}'>#{roaster.name}</a></h5><small>#{roaster.location_formatted_address}</small>"
    end

    render("roasters/index.html.erb")
  end

  def show
    @bean = Bean.new
    @roaster = Roaster.find(params[:id])

    render("roasters/show.html.erb")
  end

  def new
    if current_user.id == 1
      @roaster = Roaster.new

      render("roasters/new.html.erb")
    else
      redirect_to("/")
    end
  end

  def create
    @roaster = Roaster.new

    @roaster.description = params[:description]
    @roaster.name = params[:name]
    @roaster.website_url = params[:website_url]
    @roaster.location = params[:location]
    @roaster.cover_photo_url = params[:cover_photo_url]
    @roaster.city = params[:city]
    @roaster.delivers = params[:delivers]
    @roaster.delivery_method = params[:delivery_method]
    @roaster.delivery_notes = params[:delivery_notes]
    @roaster.delivery_geography = params[:delivery_geography]

    save_status = @roaster.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/roasters/new", "/create_roaster"
        redirect_to("/roasters")
      else
        redirect_back(:fallback_location => "/", :notice => "Roaster created successfully.")
      end
    else
      render("roasters/new.html.erb")
    end
  end

  def edit
    if current_user.id == 1
      @roaster = Roaster.find(params[:id])

      render("roasters/edit.html.erb")
    else
      redirect_to("/")
    end
  end

  def update
    @roaster = Roaster.find(params[:id])

    @roaster.description = params[:description]
    @roaster.name = params[:name]
    @roaster.website_url = params[:website_url]
    @roaster.location = params[:location]
    @roaster.cover_photo_url = params[:cover_photo_url]
    @roaster.city = params[:city]
    @roaster.delivers = params[:delivers]
    @roaster.delivery_method = params[:delivery_method]
    @roaster.delivery_notes = params[:delivery_notes]
    @roaster.delivery_geography = params[:delivery_geography]

    save_status = @roaster.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/roasters/#{@roaster.id}/edit", "/update_roaster"
        redirect_to("/roasters/#{@roaster.id}", :notice => "Roaster updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Roaster updated successfully.")
      end
    else
      render("roasters/edit.html.erb")
    end
  end

  def destroy
    if current_user.id == 1
      @roaster = Roaster.find(params[:id])

      @roaster.destroy

      if URI(request.referer).path == "/roasters/#{@roaster.id}"
        redirect_to("/", :notice => "Roaster deleted.")
      else
        redirect_back(:fallback_location => "/", :notice => "Roaster deleted.")
      end
    else
      redirect_to("/")
    end
  end
end
