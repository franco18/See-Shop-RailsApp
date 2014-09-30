# == Schema Information
#
# Table name: promos
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  id_brand    :integer
#  id_store    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  start_date  :date
#  end_date    :date
#  restriction :string(255)
#

class Promo < ActiveRecord::Base
  attr_accessible :description, :id_brand, :name, :start_date, :end_date,
    :restriction
  has_many :store_promos
  has_many :stores, through: :store_promos
  belongs_to :brand

  def self.search(search)
    if search
      where('upper(name) LIKE upper(?)', "%#{search}%")
    else
      where("1=1")
    end
  end
end
