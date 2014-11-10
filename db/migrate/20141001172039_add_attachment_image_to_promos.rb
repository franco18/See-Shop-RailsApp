class AddAttachmentImageToPromos < ActiveRecord::Migration
  def self.up
    change_table :promos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :promos, :image
  end
end
