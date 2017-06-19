class CreateMentalHealths < ActiveRecord::Migration[5.1]
  def change
    create_table :mental_healths do |t|
      t.string :name_1
      t.string :name_2
      t.string :borough
      t.string :zip
      t.string :website
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
