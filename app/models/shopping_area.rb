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

  def self.shopping_areas_in_range(user_location)
    # user_location = [latitud,longitud]
    shopping_areas = self.all
    shopping_areas_selected = [] unless shopping_areas_selected
    distances = [] unless distances
    eafit = [ 6.28305, -75.5564]#[6.200883, -75.578324]
    shopping_areas.each do |shopping_area|
      shopping_area_location = [shopping_area.latitude, shopping_area.longitude]
      distance = distance_between(eafit.clone, shopping_area_location)
      distances << distance
      shopping_areas_selected << shopping_area if distance < 2000
    end
    #Shopping areas in the range
    promos = promos_in_range(shopping_areas_selected)

  end

  def self.promos_in_range(shopping_areas)
    shopping_areas.each do |sa|
      stores_with_promos(sa)
    end
  end

  def self.stores_with_promos (shopping_area)
    promos = [] unless promos
    shopping_area.stores.each do |store|
      puts "***************Stores******************"
      puts "#{store.name}"
      puts "***************************************"
      store.promos.each do |promo|
        puts "*********************Promos de #{store.name}********************"
        puts "#{promo.name}"
        puts "***********************************************"
        promos << promo
      end
    end
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
