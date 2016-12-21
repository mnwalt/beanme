ActiveAdmin.register Roaster do

 permit_params :description, :name, :website_url, :location, :cover_photo_url, :city, :delivers, :delivery_method, :delivery_notes, :delivery_geography, :rating

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
