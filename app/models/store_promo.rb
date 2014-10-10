# == Schema Information
#
# Table name: store_promos
#
#  id         :integer          not null, primary key
#  store_id   :integer
#  promo_id   :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StorePromo < ActiveRecord::Base
  attr_accessible :promo_id, :store_id, :quantity
  belongs_to :promo
  belongs_to :store

end
