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

require 'test_helper'

class StorePromoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
