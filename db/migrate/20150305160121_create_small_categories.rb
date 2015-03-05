class CreateSmallCategories < ActiveRecord::Migration
  def change
    create_table :small_categories do |t|
      t.string :name
      t.references :large_category, index: true

      t.timestamps null: false
    end
  end
end
