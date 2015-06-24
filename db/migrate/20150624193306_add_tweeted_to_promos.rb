class AddTweetedToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :tweeted, :integer
  end
end
