class CreateWithdraws < ActiveRecord::Migration[6.0]
  def change
    create_table :withdraws do |t|
      t.integer :quantity
      t.string :token
      t.references :user, null: false, foreign_key: true
      t.references :toxic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
