class BeansController < ApplicationController
  def index
    @beans = Bean.all

    render("beans/index.html.erb")
  end

  def show
    @review = Review.new
    @inventory = Inventory.new
    @bean = Bean.find(params[:id])

    render("beans/show.html.erb")
  end

  def new
    @bean = Bean.new

    render("beans/new.html.erb")
  end

  def create
    @bean = Bean.new

    @bean.name = params[:name]
    @bean.roaster_id = params[:roaster_id]
    @bean.website_url = params[:website_url]
    @bean.image_url = params[:image_url]
    @bean.flavor_note_1 = params[:flavor_note_1]
    @bean.flavor_note_2 = params[:flavor_note_2]
    @bean.flavor_note_3 = params[:flavor_note_3]
    @bean.price_per_bag = params[:price_per_bag]
    @bean.std_bag_size_in_ounces = params[:std_bag_size_in_ounces]
    @bean.elevation_low = params[:elevation_low]
    @bean.elevation_high = params[:elevation_high]
    @bean.process = params[:process]
    @bean.varietal = params[:varietal]
    @bean.origin_country_id = params[:origin_country_id]
    @bean.caffine = params[:caffine]
    @bean.blend = params[:blend]
    @bean.espresso = params[:espresso]

    save_status = @bean.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/beans/new", "/create_bean"
        redirect_to("/beans")
      else
        redirect_back(:fallback_location => "/", :notice => "Bean created successfully.")
      end
    else
      render("beans/new.html.erb")
    end
  end

  def edit
    @bean = Bean.find(params[:id])

    render("beans/edit.html.erb")
  end

  def update
    @bean = Bean.find(params[:id])

    @bean.name = params[:name]
    @bean.roaster_id = params[:roaster_id]
    @bean.website_url = params[:website_url]
    @bean.image_url = params[:image_url]
    @bean.flavor_note_1 = params[:flavor_note_1]
    @bean.flavor_note_2 = params[:flavor_note_2]
    @bean.flavor_note_3 = params[:flavor_note_3]
    @bean.price_per_bag = params[:price_per_bag]
    @bean.std_bag_size_in_ounces = params[:std_bag_size_in_ounces]
    @bean.elevation_low = params[:elevation_low]
    @bean.elevation_high = params[:elevation_high]
    @bean.process = params[:process]
    @bean.varietal = params[:varietal]
    @bean.origin_country_id = params[:origin_country_id]
    @bean.caffine = params[:caffine]
    @bean.blend = params[:blend]
    @bean.espresso = params[:espresso]

    save_status = @bean.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/beans/#{@bean.id}/edit", "/update_bean"
        redirect_to("/beans/#{@bean.id}", :notice => "Bean updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bean updated successfully.")
      end
    else
      render("beans/edit.html.erb")
    end
  end

  def destroy
    @bean = Bean.find(params[:id])

    @bean.destroy

    if URI(request.referer).path == "/beans/#{@bean.id}"
      redirect_to("/", :notice => "Bean deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bean deleted.")
    end
  end
end
