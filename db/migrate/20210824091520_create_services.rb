class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :phone_number
      t.string :predominant_disease
      t.string :typical_workday
      t.string :predominant_drugs

      t.timestamps
    end
  end
end
