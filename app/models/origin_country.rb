class OriginCountry < ApplicationRecord
  before_save :geocode_name

  def geocode_name
    if self.name.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.name)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end

  # Direct associations

  has_many   :beans,
             :dependent => :destroy

  # Indirect associations

  has_many   :reviews,
             :through => :beans,
             :source => :reviews

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

end
