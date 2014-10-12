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
  factory :store do
  end
end
