class AddAttachmentLogoToBizPromos < ActiveRecord::Migration
  def self.up
    add_column :biz_promos, :logo, :string
  end

  def self.down
    remove_column :biz_promos, :logo
  end
end
