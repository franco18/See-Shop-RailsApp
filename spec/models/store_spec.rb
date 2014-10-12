# == Schema Information
#
# Table name: stores
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  brand_id         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  phone            :string(255)
#  email            :string(255)
#  address          :string(255)
#  shopping_area_id :integer
#  longitude        :float
#  latitude         :float
#

require 'spec_helper'

RSpec.describe Store, :type => :model do
  before(:each) do
    @attr = {
      name:      "Example Store",
      email:     "store@example2.com",
      phone:     "30982741",
      latitude:  6.201161,
      longitude: -75.578441,
      address:   "Example Street 2"
    }
  end

  it "should create a new instance given valid attributes" do
    Store.create!(@attr)
  end

  it "should require a name" do
    no_name_store = Store.new(@attr.merge(name: ""))
    no_name_store.should_not be_valid
  end

  it "should require an email" do
    no_email_store = Store.new(@attr.merge(email: ""))
    no_email_store.should_not be_valid
  end

  it "should reject invalid email addresses" do
    addresses = %w[store@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_store = Store.new(@attr.merge(email: address))
      invalid_email_store.should_not be_valid
    end
  end

  it "should require an address" do
    no_address_store = Store.new(@attr.merge(address: ""))
  end

  it "should require latitude" do
    no_latitude_store = Store.new(@attr.merge(latitude: nil))
    no_latitude_store.should_not be_valid
  end

  it "should require longitude" do
    no_longitude_store = Store.new(@attr.merge(longitude: nil))
    no_longitude_store.should_not be_valid
  end

  it "should search a store" do
    Store.create!(@attr)
    brand_searched = Store.search("exam")
    brand_searched.should_not be_nil
  end

  it "should delete its promos on delete"
end
