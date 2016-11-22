Rails.application.routes.draw do
  # Routes for the Inventory resource:
  # CREATE
  get "/inventories/new", :controller => "inventories", :action => "new"
  post "/create_inventory", :controller => "inventories", :action => "create"

  # READ
  get "/inventories", :controller => "inventories", :action => "index"
  get "/inventories/:id", :controller => "inventories", :action => "show"

  # UPDATE
  get "/inventories/:id/edit", :controller => "inventories", :action => "edit"
  post "/update_inventory/:id", :controller => "inventories", :action => "update"

  # DELETE
  get "/delete_inventory/:id", :controller => "inventories", :action => "destroy"
  #------------------------------

  # Routes for the Roaster resource:
  # CREATE
  get "/roasters/new", :controller => "roasters", :action => "new"
  post "/create_roaster", :controller => "roasters", :action => "create"

  # READ
  get "/roasters", :controller => "roasters", :action => "index"
  get "/roasters/:id", :controller => "roasters", :action => "show"

  # UPDATE
  get "/roasters/:id/edit", :controller => "roasters", :action => "edit"
  post "/update_roaster/:id", :controller => "roasters", :action => "update"

  # DELETE
  get "/delete_roaster/:id", :controller => "roasters", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Origin_country resource:
  # CREATE
  get "/origin_countries/new", :controller => "origin_countries", :action => "new"
  post "/create_origin_country", :controller => "origin_countries", :action => "create"

  # READ
  get "/origin_countries", :controller => "origin_countries", :action => "index"
  get "/origin_countries/:id", :controller => "origin_countries", :action => "show"

  # UPDATE
  get "/origin_countries/:id/edit", :controller => "origin_countries", :action => "edit"
  post "/update_origin_country/:id", :controller => "origin_countries", :action => "update"

  # DELETE
  get "/delete_origin_country/:id", :controller => "origin_countries", :action => "destroy"
  #------------------------------

  # Routes for the Bean resource:
  # CREATE
  get "/beans/new", :controller => "beans", :action => "new"
  post "/create_bean", :controller => "beans", :action => "create"

  # READ
  get "/beans", :controller => "beans", :action => "index"
  get "/beans/:id", :controller => "beans", :action => "show"

  # UPDATE
  get "/beans/:id/edit", :controller => "beans", :action => "edit"
  post "/update_bean/:id", :controller => "beans", :action => "update"

  # DELETE
  get "/delete_bean/:id", :controller => "beans", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
