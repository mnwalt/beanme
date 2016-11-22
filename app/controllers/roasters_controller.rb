class RoastersController < ApplicationController
  def index
    @roasters = Roaster.all

    render("roasters/index.html.erb")
  end

  def show
    @roaster = Roaster.find(params[:id])

    render("roasters/show.html.erb")
  end

  def new
    @roaster = Roaster.new

    render("roasters/new.html.erb")
  end

  def create
    @roaster = Roaster.new

    @roaster.description = params[:description]
    @roaster.name = params[:name]
    @roaster.website_url = params[:website_url]
    @roaster.location = params[:location]
    @roaster.cover_photo_url = params[:cover_photo_url]
    @roaster.city = params[:city]

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
    @roaster = Roaster.find(params[:id])

    render("roasters/edit.html.erb")
  end

  def update
    @roaster = Roaster.find(params[:id])

    @roaster.description = params[:description]
    @roaster.name = params[:name]
    @roaster.website_url = params[:website_url]
    @roaster.location = params[:location]
    @roaster.cover_photo_url = params[:cover_photo_url]
    @roaster.city = params[:city]

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
    @roaster = Roaster.find(params[:id])

    @roaster.destroy

    if URI(request.referer).path == "/roasters/#{@roaster.id}"
      redirect_to("/", :notice => "Roaster deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Roaster deleted.")
    end
  end
end
