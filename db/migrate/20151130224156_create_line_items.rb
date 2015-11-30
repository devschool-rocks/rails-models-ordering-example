class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.string :qty_amount
      t.string :qty_label
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
