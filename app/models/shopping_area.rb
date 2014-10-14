# == Schema Information
#
# Table name: shopping_areas
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#  city        :string(255)
#  address     :string(255)
#

class ShoppingArea < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name, :description, :city, :address

  has_many :stores, dependent: :destroy

  validates :name, :latitude, :longitude, :city, :address, presence: true

  def self.shopping_areas_in_range(user_location)
    # user_location = [latitud,longitud]
    shopping_areas = self.all
    shopping_areas_selected = [] unless shopping_areas_selected
    distances = [] unless distances
    Rails.logger.info "user_location = #{user_location}"
    # eafit = [6.201172, -75.578366]
    #Rails.logger.info "Acabe de asignar eafit = [ 6.28305, -75.5564]"
    shopping_areas.each do |shopping_area|
      shopping_area_location = [shopping_area.latitude, shopping_area.longitude]
      Rails.logger.info "#{shopping_area.name}"
      distance = distance_between(user_location.clone, shopping_area_location)
      Rails.logger.info "#Distance to #{shopping_area.name} is #{distance}"
      distances << distance
      shopping_areas_selected << shopping_area if distance < 2000
      Rails.logger.info "shopping_areas_selected: #{shopping_areas_selected}"
    end
    #Shopping areas in the range
    promos = promos_in_range(shopping_areas_selected)
    Rails.logger.info "Promos: #{promos}"
    return promos
  end

  def self.promos_in_range(shopping_areas)
    promos = [] unless promos
    stores = [] unless stores
    shopping_areas_array = []
    shopping_areas.each do |sa|
      sa.stores.each do |store|
        store.promos.each do |promo|
          promo[:brand_name] = promo.brand.name
          # promo[:image_encode] = Base64.encode64(File.open(promo.image.path).read)
          promos << promo unless promos.include? promo
        end
        store[:promos] = promos
        stores << store unless stores.include? store
      end
      sa[:stores] = stores
      shopping_areas_array << sa unless shopping_areas_array.include? sa
      # promos = stores_with_promos(sa)
    end
    shopping_areas_array
  end

  def self.distance_between a, b
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters
    dlon_rad = (b[1]-a[1]) * rad_per_deg  # Delta, converted to rad
    dlat_rad = (b[0]-a[0]) * rad_per_deg
    lat1_rad, lon1_rad = a.map! {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = b.map! {|i| i * rad_per_deg }
    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
    rm * c # Delta in meters
  end

  def self.search(search)
    if search
      where('name LIKE upper(?) or description LIKE (?) or city LIKE (?) or address
        LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      where("1=1")
    end
  end
end
