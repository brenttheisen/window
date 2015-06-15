class AddAttachmentLogoToBizPromos < ActiveRecord::Migration
  def self.up
    change_table :biz_promos do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :biz_promos, :logo
  end
end
