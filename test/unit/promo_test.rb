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

require 'test_helper'

class PromoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
