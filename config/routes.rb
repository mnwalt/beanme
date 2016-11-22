Rails.application.routes.draw do
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
