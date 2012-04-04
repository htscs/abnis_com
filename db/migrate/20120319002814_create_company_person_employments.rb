class CreateCompanyPersonEmployments < ActiveRecord::Migration
  def change
    create_table :company_person_employments do |t|
      t.references :company
      t.references :person
      t.string	'summary'
      t.timestamps
    end
    add_index :company_person_employments, ['company_id','person_id']
  end
end
