class RenameClumnFieldInCompanies < ActiveRecord::Migration
  def up
  	rename_column("companies","field","sector")
  end

  def down
  	rename_column("companies","sector","field")
  end
end
