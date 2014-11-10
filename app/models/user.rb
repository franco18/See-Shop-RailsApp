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

class User < ActiveRecord::Base
  attr_accessible :notifications_code, :username, :facebook_id, :email, :gender,
    :birthday
  validates :username, :facebook_id, presence: true
  validates :notifications_code, uniqueness: true
end
