# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string(255)
#  notifications_code :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  facebook_id        :string(255)
#  email              :string(255)
#  birthday           :date
#  gender             :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "MyString"
    notifications_code "MyString"
  end
end
