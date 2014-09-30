# == Schema Information
#
# Table name: stores
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  id_brand         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  phone            :string(255)
#  email            :string(255)
#  address          :string(255)
#  id_shopping_area :integer
#

class Store < ActiveRecord::Base
  attr_accessible :id_brand, :name, :phone, :email, :address, :id_shopping_area
  belongs_to :brand
  has_many :promos
  has_many :store_promos
  has_many :promos, through: :store_promos

  def self.search(search)
    if search
      where('name LIKE upper(?) or phone LIKE (?) or address like (?)',
        "%#{search}%", "%#{search}%", "%#{search}%")
    else
      where("1=1")
    end
  end
end
