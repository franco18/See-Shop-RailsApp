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

class Brand < ActiveRecord::Base
  attr_accessible :description, :email, :name, :web_page, :nit, :phone, :avatar
  has_many :stores
  has_many :promos
  has_attached_file :avatar, url: "/assets/images/brands/:id/:basename.:extension",
    :default_url => "no_picture.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :avatar, :attachment_presence => true

  def self.search(search)
    if search
      where('name LIKE upper(?) or email LIKE (?) or description LIKE (?) or
        web_page LIKE (?) or nit LIKE (?) or phone LIKE (?)', "%#{search}%")
    else
      where("1=1")
    end
  end
end
