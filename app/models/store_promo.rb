# == Schema Information
#
# Table name: store_promos
#
#  id         :integer          not null, primary key
#  id_store   :integer
#  id_promo   :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StorePromo < ActiveRecord::Base
  attr_accessible :id_promo, :id_store, :quantity
  belongs_to :promo
  belongs_to :store

end
