class Bean < ApplicationRecord
  before_save :geocode_region

  def geocode_region
    if self.region.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.region)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.region_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.region_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.region_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :roaster,
             :counter_cache => true

  belongs_to :country,
             :class_name => "OriginCountry",
             :foreign_key => "origin_country_id",
             :counter_cache => true

  has_many   :reviews,
             :dependent => :destroy

  has_many   :inventories,
             :dependent => :destroy

  has_many   :labs, :through => :inventories, :source => :user

    # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:roaster_id] }

  validates :name, :presence => true

  validates :origin_country_id, :presence => true

  validates :roaster_id, :presence => true

end
