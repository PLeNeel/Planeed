class CreateToxics < ActiveRecord::Migration[6.0]
  def change
    create_table :toxics do |t|
      t.string :name
      t.integer :total_quantity
      t.integer :current_quantity
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
