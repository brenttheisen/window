class CreateBizPromos < ActiveRecord::Migration
  def change
    create_table :biz_promos do |t|
      t.string :business_name
      t.string :twitter_handle
      t.string :website_url
      t.string :facebook_url
      t.string :instagram_handle

      t.timestamps null: false
    end
  end
end
