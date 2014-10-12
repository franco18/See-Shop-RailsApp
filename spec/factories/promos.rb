# == Schema Information
#
# Table name: promos
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :text
#  brand_id           :integer
#  store_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  start_date         :date
#  end_date           :date
#  restriction        :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  image_url          :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :promo do
  end
end
