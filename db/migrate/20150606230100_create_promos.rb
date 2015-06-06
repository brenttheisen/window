class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :twitter_handle
      t.string :band_name
      t.string :youtube_channel
      t.string :website_link
      t.string :itunes_link
      t.string :soundcloud_link
      t.string :fb_link
      t.string :insta_link

      t.timestamps null: false
    end
  end
end
