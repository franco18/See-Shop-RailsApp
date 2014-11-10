# == Schema Information
#
# Table name: stores
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  brand_id         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  phone            :string(255)
#  email            :string(255)
#  address          :string(255)
#  shopping_area_id :integer
#  longitude        :float
#  latitude         :float
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store do |store|
    store.name      "Example Store FactoryGirl"
    store.email     "store2@example2.com"
    store.phone     "30982741"
    store.latitude  6.201161
    store.longitude -75.578441
    store.address   "Example Street 2"
    store.association :brand
  end
end
