class AddLogoToBizPromos < ActiveRecord::Migration
  def change
    add_column :biz_promos, :logo, :string
  end
end
