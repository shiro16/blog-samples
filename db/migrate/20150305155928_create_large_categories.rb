class CreateLargeCategories < ActiveRecord::Migration
  def change
    create_table :large_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
