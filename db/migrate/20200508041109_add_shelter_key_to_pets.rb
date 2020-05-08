class AddShelterKeyToPets < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :pets, :shelters
  end
end
