class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :homonymy
      t.string :image
      t.string :tax_code
      t.boolean :male
      t.text :memo
      t.integer :nationality_id
      t.date :born_date
      t.integer :born_city_id

      t.timestamps
    end
  end
end
