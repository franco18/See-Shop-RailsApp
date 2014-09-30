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
#

require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
