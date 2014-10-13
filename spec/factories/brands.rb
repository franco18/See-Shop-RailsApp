# == Schema Information
#
# Table name: brands
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  email               :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  web_page            :string(255)
#  nit                 :string(255)
#  phone               :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  image_url           :string(255)
#

FactoryGirl.define do
  factory :brand do |brand|
    brand.name        "Example BrandvFactoryGirl"
    brand.email       "brand@example2.com"
    brand.web_page    "www.examplebrand.com"
    brand.description "This is a description"
    brand.nit         "1284973048217093"
    brand.phone       "30982741"
    brand.avatar      File.new("app//assets/images/no_picture.png")
  end
end
