Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "beans#index"

  # Routes for the Review resource:
  # CREATE
  get "/reviews/new", :controller => "reviews", :action => "new"
  post "/create_review", :controller => "reviews", :action => "create"

  # READ
  get "/reviews", :controller => "reviews", :action => "index"
  get "/reviews/:id", :controller => "reviews", :action => "show"
  
  # UPDATE
  get "/reviews/:id/edit", :controller => "reviews", :action => "edit"
  post "/update_review/:id", :controller => "reviews", :action => "update"

  # DELETE
  get "/delete_review/:id", :controller => "reviews", :action => "destroy"
  #------------------------------

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
  # Route for Favorites page resource:
  get "/favorites/", :controller => "beans", :action => "favs"

  # UPDATE
  get "/beans/:id/edit", :controller => "beans", :action => "edit"
  post "/update_bean/:id", :controller => "beans", :action => "update"

  # DELETE
  get "/delete_bean/:id", :controller => "beans", :action => "destroy"
  #------------------------------

  # Routes for Brew Guide:
  get "/brew_guide/", :controller => "brew_guides", :action => "chemex_form"

  get "/brew_guide/chemex_new", :controller => "brew_guides", :action => "chemex_form"
  get "/brew_guide/chemex_results", :controller => "brew_guides", :action => "chemex"

  get "/brew_guide/v60_new", :controller => "brew_guides", :action => "v60_form"
  get "/brew_guide/v60_results", :controller => "brew_guides", :action => "v60"

  get "/brew_guide/french_press_new", :controller => "brew_guides", :action => "french_press_form"
  get "/brew_guide/french_press_results", :controller => "brew_guides", :action => "french_press"

  # Routes for Community:
  get "/community/", :controller => "communities", :action => "index"
  #------------------------------

  # Routes for the Like resource:
  # CREATE
  get "/likes/new", :controller => "likes", :action => "new"
  post "/create_like", :controller => "likes", :action => "create"

  # READ
  get "/likes", :controller => "likes", :action => "index"
  get "/likes/:id", :controller => "likes", :action => "show"

  # UPDATE
  get "/likes/:id/edit", :controller => "likes", :action => "edit"
  post "/update_like/:id", :controller => "likes", :action => "update"

  # DELETE
  get "/delete_like/:id", :controller => "likes", :action => "destroy"
  #------------------------------

  # Routes for the Response resource:
  # CREATE
  get "/responses/new", :controller => "responses", :action => "new"
  post "/create_response", :controller => "responses", :action => "create"

  # READ
  get "/responses", :controller => "responses", :action => "index"
  get "/responses/:id", :controller => "responses", :action => "show"

  # UPDATE
  get "/responses/:id/edit", :controller => "responses", :action => "edit"
  post "/update_response/:id", :controller => "responses", :action => "update"

  # DELETE
  get "/delete_response/:id", :controller => "responses", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
