class AddServiceIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :service, null: false, foreign_key: true
  end
end
