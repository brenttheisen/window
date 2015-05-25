class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.string :email
      t.string :address
      t.string :name
      t.string :phone

      t.timestamps null: false
    end
  end
end
