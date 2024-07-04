class CreateGyms < ActiveRecord::Migration[7.1]
  def change
    create_table :gyms do |t|
      t.string :name
      t.integer :number_of_champions
      t.boolean :holds_current_champion

      t.timestamps
    end
  end
end
