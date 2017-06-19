class CreateHealthCenters < ActiveRecord::Migration[5.1]
  def change
    create_table :health_centers do |t|
      t.string :borough
      t.string :address
      t.string :name
      t.string :phone
      t.string :zip

      t.timestamps
    end
  end
end
