class BeansController < ApplicationController
  def index
    @q = Bean.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.blank?
    @beans = @q.result(:distinct => true).includes(:inventories, :reviews, :country, :roaster).page(params[:page]).per(12)

    render("beans/index.html.erb")
  end

  def favs
    @q = Bean.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.blank?
    @beans = @q.result(:distinct => true).includes(:inventories, :reviews, :country, :roaster).page(params[:page]).per(12)

    render("beans/favs.html.erb")
  end

  def show
    @review = Review.new
    @inventory = Inventory.new
    @bean = Bean.find(params[:id])

    render("beans/show.html.erb")
  end

  def new
    if current_user.id == 1
      @bean = Bean.new

      render("beans/new.html.erb")
    else
      redirect_to("/")
    end
  end

  def create
    @bean = Bean.new

    @bean.name = params[:name]
    @bean.roaster_id = params[:roaster_id]
    @bean.website_url = params[:website_url]
    @bean.image_url = params[:image_url]
    @bean.flavor_note_1 = params[:flavor_note_1]
    @bean.price_per_bag = params[:price_per_bag]
    @bean.bag_size_grams = params[:bag_size_grams]
    @bean.elevation_masl_low = params[:elevation_masl_low]
    @bean.elevation_masl_high = params[:elevation_masl_high]
    @bean.process = params[:process]
    @bean.varietal = params[:varietal]
    @bean.origin_country_id = params[:origin_country_id]
    @bean.caffine = params[:caffine]
    @bean.region = params[:region]
    @bean.blend = params[:blend]
    @bean.espresso = params[:espresso]
    @bean.producer = params[:producer]
    @bean.description = params[:description]

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
    if current_user.id == 1
      @bean = Bean.find(params[:id])

      render("beans/edit.html.erb")
    else
      redirect_to("/")
    end
  end

  def update
    @bean = Bean.find(params[:id])

    @bean.name = params[:name]
    @bean.roaster_id = params[:roaster_id]
    @bean.website_url = params[:website_url]
    @bean.image_url = params[:image_url]
    @bean.flavor_note_1 = params[:flavor_note_1]
    @bean.price_per_bag = params[:price_per_bag]
    @bean.bag_size_grams = params[:bag_size_grams]
    @bean.elevation_masl_low = params[:elevation_masl_low]
    @bean.elevation_masl_high = params[:elevation_masl_high]
    @bean.process = params[:process]
    @bean.varietal = params[:varietal]
    @bean.origin_country_id = params[:origin_country_id]
    @bean.caffine = params[:caffine]
    @bean.region = params[:region]
    @bean.blend = params[:blend]
    @bean.espresso = params[:espresso]
    @bean.producer = params[:producer]
    @bean.description = params[:description]

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
    if current_user.id == 1
      @bean = Bean.find(params[:id])

      @bean.destroy

      if URI(request.referer).path == "/beans/#{@bean.id}"
        redirect_to("/", :notice => "Bean deleted.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bean deleted.")
      end
    else
      redirect_to("/")
    end
  end
end
