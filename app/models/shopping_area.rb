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

  def self.search(search)
    if search
      where('name LIKE upper(?) or description LIKE (?) or city LIKE (?) or address
        LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      where("1=1")
    end
  end
end
