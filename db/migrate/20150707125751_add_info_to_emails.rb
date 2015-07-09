class AddInfoToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :phone, :string
    add_column :emails, :website, :string
  end
end
