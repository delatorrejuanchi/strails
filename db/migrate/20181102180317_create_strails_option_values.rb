class CreateStrailsOptionValues < ActiveRecord::Migration[5.2]
  def change
    create_table :strails_option_values do |t|
      t.string :name
      t.string :presentation
      t.references :option_type, foreign_key: true

      t.timestamps
    end
  end
end
