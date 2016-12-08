class OriginCountriesController < ApplicationController
  def index
    @q = OriginCountry.ransack(params[:q])
    @origin_countries = @q.result(:distinct => true).includes(:beans, :reviews).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@origin_countries.where.not(:location_latitude => nil)) do |origin_country, marker|
      marker.lat origin_country.location_latitude
      marker.lng origin_country.location_longitude
      marker.infowindow "<h5><a href='/origin_countries/#{origin_country.id}'>#{origin_country.name}</a></h5><small>#{origin_country.location_formatted_address}</small>"
    end

    render("origin_countries/index.html.erb")
  end

  def show
    @bean = Bean.new
    @origin_country = OriginCountry.find(params[:id])

    render("origin_countries/show.html.erb")
  end

  def new
    if current_user.id == 1
      @origin_country = OriginCountry.new

      render("origin_countries/new.html.erb")
    else
      redirect_to("/")
    end
  end

  def create
    @origin_country = OriginCountry.new

    @origin_country.description = params[:description]
    @origin_country.cover_photo_url = params[:cover_photo_url]
    @origin_country.name = params[:name]

    save_status = @origin_country.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/origin_countries/new", "/create_origin_country"
        redirect_to("/origin_countries")
      else
        redirect_back(:fallback_location => "/", :notice => "Origin country created successfully.")
      end
    else
      render("origin_countries/new.html.erb")
    end
  end

  def edit
    if current_user.id == 1
      @origin_country = OriginCountry.find(params[:id])

      render("origin_countries/edit.html.erb")
    else
      redirect_to("/")
    end
  end

  def update
    @origin_country = OriginCountry.find(params[:id])

    @origin_country.description = params[:description]
    @origin_country.cover_photo_url = params[:cover_photo_url]
    @origin_country.name = params[:name]

    save_status = @origin_country.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/origin_countries/#{@origin_country.id}/edit", "/update_origin_country"
        redirect_to("/origin_countries/#{@origin_country.id}", :notice => "Origin country updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Origin country updated successfully.")
      end
    else
      render("origin_countries/edit.html.erb")
    end
  end

  def destroy
    if current_user.id == 1
      @origin_country = OriginCountry.find(params[:id])

      @origin_country.destroy

      if URI(request.referer).path == "/origin_countries/#{@origin_country.id}"
        redirect_to("/", :notice => "Origin country deleted.")
      else
        redirect_back(:fallback_location => "/", :notice => "Origin country deleted.")
      end
    else
      redirect_to("/")
    end
  end
end
