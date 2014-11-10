# == Schema Information
#
# Table name: promos
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :text
#  brand_id           :integer
#  store_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  start_date         :date
#  end_date           :date
#  restriction        :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  image_url          :string(255)
#

require 'spec_helper'

RSpec.describe Promo, :type => :model do
  before(:each) do
    @attr = {
      name:      "Example Promo",
      description: "This is the promo description",
      start_date: Date.today,
      end_date: Date.tomorrow,
      brand_id: 1,
      restriction: "This is the promo restriction",
      image: File.new("app//assets/images/no_picture.png")
    }
  end

  it "should create a new instance given valid attributes" do
    Promo.create!(@attr)
  end

  it "should require a name" do
    no_name_promo = Promo.new(@attr.merge(name: ""))
    no_name_promo.should_not be_valid
  end

  it "should require a description" do
    no_description_promo = Promo.new(@attr.merge(description: ""))
    no_description_promo.should_not be_valid
  end

  it "should require a start_date" do
    no_start_date_promo = Promo.new(@attr.merge(start_date: nil))
    no_start_date_promo.should_not be_valid
  end

  it "should require an end_date" do
    no_end_date_promo = Promo.new(@attr.merge(end_date: nil))
    no_end_date_promo.should_not be_valid
  end

  it "should require a restriction" do
    no_restriction_promo = Promo.new(@attr.merge(restriction: ""))
    no_restriction_promo.should_not be_valid
  end

  it "should require an image" do
    no_image_promo = Promo.new(@attr.merge(image: ""))
    no_image_promo.should_not be_valid
  end

  it "should require a brand_id" do
    no_brand_id_promo = Promo.new(@attr.merge(brand_id: nil))
    no_brand_id_promo.should_not be_valid
  end

  it "should search a promo" do
    Promo.create!(@attr)
    brand_searched = Promo.search("exam")
    brand_searched.should_not be_nil
  end

end
