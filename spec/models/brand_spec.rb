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
#  image_url           :string(255)
#

require 'spec_helper'

RSpec.describe Brand, :type => :model do

  before(:each) do
    @attr = {
      name: "Example Brand",
      email: "brand@example2.com",
      web_page: "www.examplebrand.com",
      description: "This is a description",
      nit: "1284973048217093",
      phone: "30982741",
      avatar: File.new("app//assets/images/no_picture.png")
    }
  end

  it "should create a new instance given valid attributes" do
    Brand.create!(@attr)
  end

  it "should require a name" do
    no_name_brand = Brand.new(@attr.merge(name: ""))
    no_name_brand.should_not be_valid
  end

  it "should require an email" do
    no_email_brand = Brand.new(@attr.merge(email: ""))
    no_email_brand.should_not be_valid
  end

  it "should reject invalid email addresses" do
    addresses = %w[brand@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_brand = Brand.new(@attr.merge(email: address))
      invalid_email_brand.should_not be_valid
    end
  end

  it "should require a nit number" do
    no_nit_brand = Brand.new(@attr.merge(nit: ""))
    no_nit_brand.should_not be_valid
  end

  it "should require an image" do
    no_image_brand = Brand.new(@attr.merge(avatar: ""))
    no_image_brand.should_not be_valid
  end

  it "should search a brand" do
    Brand.create!(@attr)
    brand_searched = Brand.search("exam")
    brand_searched.should_not be_nil
  end

  describe "store associations" do
    before(:each) do
      @brand = Brand.create(@attr)
      @store1 = create(:store, brand: @brand)
      @store2 = create(:store, brand: @brand)
    end

    it "should have a stores attribute" do
      @brand.should respond_to(:stores)
    end
    it "should have the right stores in the right order" do
      @brand.stores.should == [@store1, @store2]
    end
    it "should destroy associated stores" do
      @brand.destroy
      [@store1, @store2].each do |store|
        Store.find_by_id(store.id).should be_nil
      end
    end
  end
end
