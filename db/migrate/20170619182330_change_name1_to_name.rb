class ChangeName1ToName < ActiveRecord::Migration[5.1]
  def change
    rename_column :mental_healths, :name_1, :name
  end
end
