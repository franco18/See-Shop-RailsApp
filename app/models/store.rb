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

class Store < ActiveRecord::Base
  attr_accessible :brand_id, :name, :phone, :email, :address, :shopping_area_id,
    :longitude, :latitude
  belongs_to :brand
  belongs_to :shopping_area
  has_many :promos
  has_many :store_promos
  has_many :promos, through: :store_promos

  validates :name, :email, :address, :latitude, :longitude, presence: true

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, format: { with: email_regex }

  def self.search(search)
    if search
      where('name LIKE upper(?) or phone LIKE (?) or address like (?)',
        "%#{search}%", "%#{search}%", "%#{search}%")
    else
      where("1=1")
    end
  end
end
