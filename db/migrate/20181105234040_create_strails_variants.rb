class CreateStrailsVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :strails_variants do |t|
      t.string :sku
      t.decimal :price, precision: 10, scale: 2
      t.boolean :is_master
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
