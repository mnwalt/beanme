ActiveAdmin.register Bean do

 permit_params :name, :roaster_id, :website_url, :image_url, :flavor_note_1, :price_per_bag, :bag_size_grams, :elevation_masl_low, :elevation_masl_high, :process, :varietal, :origin_country_id, :caffine, :region, :blend, :espresso, :producer, :description, :rating

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
