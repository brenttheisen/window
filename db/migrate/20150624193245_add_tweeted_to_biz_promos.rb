class AddTweetedToBizPromos < ActiveRecord::Migration
  def change
    add_column :biz_promos, :tweeted, :integer
  end
end
