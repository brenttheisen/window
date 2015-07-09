class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company

      t.timestamps null: false
    end
  end
end
