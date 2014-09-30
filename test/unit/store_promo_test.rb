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

require 'test_helper'

class StorePromoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
