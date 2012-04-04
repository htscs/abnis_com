class CreateCommedies < ActiveRecord::Migration
  def change
    create_table :commedies do |t|
      t.string :name

      t.timestamps
    end
  end
end
