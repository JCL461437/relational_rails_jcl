class CreateFighters < ActiveRecord::Migration[7.1]
  def change
    create_table :fighters do |t|
      t.string :name
      t.integer :age
      t.string :style
      t.boolean :active
      t.references :gym, null: false, foreign_key: true

      t.timestamps
    end
  end
end
