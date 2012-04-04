class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :image
      t.string :field
      t.string :status
      t.text :memo

      t.timestamps
    end
  end
end
