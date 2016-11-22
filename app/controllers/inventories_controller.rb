class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all

    render("inventories/index.html.erb")
  end

  def show
    @inventory = Inventory.find(params[:id])

    render("inventories/show.html.erb")
  end

  def new
    @inventory = Inventory.new

    render("inventories/new.html.erb")
  end

  def create
    @inventory = Inventory.new

    @inventory.user_id = params[:user_id]
    @inventory.bean_id = params[:bean_id]
    @inventory.quantity_ounces = params[:quantity_ounces]
    @inventory.roast_date = params[:roast_date]

    save_status = @inventory.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/inventories/new", "/create_inventory"
        redirect_to("/inventories")
      else
        redirect_back(:fallback_location => "/", :notice => "Inventory created successfully.")
      end
    else
      render("inventories/new.html.erb")
    end
  end

  def edit
    @inventory = Inventory.find(params[:id])

    render("inventories/edit.html.erb")
  end

  def update
    @inventory = Inventory.find(params[:id])

    @inventory.user_id = params[:user_id]
    @inventory.bean_id = params[:bean_id]
    @inventory.quantity_ounces = params[:quantity_ounces]
    @inventory.roast_date = params[:roast_date]

    save_status = @inventory.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/inventories/#{@inventory.id}/edit", "/update_inventory"
        redirect_to("/inventories/#{@inventory.id}", :notice => "Inventory updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Inventory updated successfully.")
      end
    else
      render("inventories/edit.html.erb")
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])

    @inventory.destroy

    if URI(request.referer).path == "/inventories/#{@inventory.id}"
      redirect_to("/", :notice => "Inventory deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Inventory deleted.")
    end
  end
end
