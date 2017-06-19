class AddName2ToHealthCenter < ActiveRecord::Migration[5.1]
  def change
    add_column :health_centers, :name_2, :string
  end
end
