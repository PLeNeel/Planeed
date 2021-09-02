class CreateLastMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :last_messages do |t|
      t.references :message, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
