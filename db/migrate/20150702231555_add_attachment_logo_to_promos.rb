class AddAttachmentLogoToPromos < ActiveRecord::Migration
  def self.up
    change_table :promos do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :promos, :logo
  end
end
