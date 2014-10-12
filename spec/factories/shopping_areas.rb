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
  factory :shopping_area do
  end
end
