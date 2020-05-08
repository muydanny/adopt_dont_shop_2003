class AddPets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :image
      t.integer :approximate_age
      t.string :sex
      t.integer :shelter_id

      t.timestamps
    end
  end
end
