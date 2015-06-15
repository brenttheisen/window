class AddLogoToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :logo, :string
  end
end
