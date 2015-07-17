class AddAttachmentLogoToPromos < ActiveRecord::Migration
  def self.up
    add_column :promos, :logo, :string
  end

  def self.down
    remove_column :promos, :logo
  end
end
