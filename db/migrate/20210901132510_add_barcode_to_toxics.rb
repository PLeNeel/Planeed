class AddBarcodeToToxics < ActiveRecord::Migration[6.0]
  def change
    add_column :toxics, :barcode, :string
  end
end
