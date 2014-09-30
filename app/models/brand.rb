# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  email       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  web_page    :string(255)
#  nit         :string(255)
#  phone       :string(255)
#

class Brand < ActiveRecord::Base
  attr_accessible :description, :email, :name, :web_page, :nit, :phone
  has_many :stores

  def self.search(search)
    if search
      where('upper(name) LIKE upper(?)', "%#{search}%")
    else
      where("1=1")
    end
  end
end
