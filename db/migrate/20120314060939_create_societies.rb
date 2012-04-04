class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :name
      t.string :image
      t.string :field
      t.string :status

      t.timestamps
    end
  end
end
