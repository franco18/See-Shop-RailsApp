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

class Promo < ActiveRecord::Base
  attr_accessible :description, :brand_id, :name, :start_date, :end_date,
    :restriction, :image
  has_many :store_promos, dependent: :destroy
  has_many :stores, through: :store_promos
  belongs_to :brand

  has_attached_file :image, url: "/assets/images/promos/:id/:basename.:extension",
    :default_url => "no_picture.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :image, :attachment_presence => true
  validates :name, :description, :start_date, :end_date, :restriction, :brand_id,
    presence: true

  def self.search(search)
    if search
      where('name LIKE (?) or restriction LIKE (?) or description LIKE (?)',
        "%#{search}%", "%#{search}%", "%#{search}%")
    else
      where("1=1")
    end
  end
end
