# == Schema Information
#
# Table name: shopping_areas
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#  city        :string(255)
#  address     :string(255)
#

require 'spec_helper'

RSpec.describe ShoppingArea, :type => :model do
  before(:each) do
    @attr = {
      name:        "Example ShoppingArea",
      latitude:    6.201161,
      longitude:   -75.578441,
      city:        "Medellin",
      address:     "Example Street 2",
      description: "This is a shopping area"
    }
  end

  it "should create a new instance given valid attributes" do
    ShoppingArea.create!(@attr)
  end

  it "should require a name" do
    no_name_shopping_area = ShoppingArea.new(@attr.merge(name: ""))
    no_name_shopping_area.should_not be_valid
  end

  it "should require a city" do
    no_city_shopping_area = ShoppingArea.new(@attr.merge(city: ""))
    no_city_shopping_area.should_not be_valid
  end

  it "should require an address" do
    no_address_shopping_area = ShoppingArea.new(@attr.merge(address: ""))
  end

  it "should require latitude" do
    no_latitude_shopping_area = ShoppingArea.new(@attr.merge(latitude: nil))
    no_latitude_shopping_area.should_not be_valid
  end

  it "should require longitude" do
    no_longitude_shopping_area = ShoppingArea.new(@attr.merge(longitude: nil))
    no_longitude_shopping_area.should_not be_valid
  end

  it "should search a shopping_area" do
    ShoppingArea.create!(@attr)
    shopping_area_searched = ShoppingArea.search("exam")
    shopping_area_searched.should_not be_nil
  end

  it "should delete its stores when delete"
end
