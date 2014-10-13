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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shopping_area do |shopping_area|
    shopping_area.name        "Example ShoppingArea FactoryGirl"
    shopping_area.latitude    6.201161
    shopping_area.longitude   -75.578441
    shopping_area.city        "Medellin"
    shopping_area.address     "Example Street 2"
    shopping_area.description "This is a shopping area"
  end
end
