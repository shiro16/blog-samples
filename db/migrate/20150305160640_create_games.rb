class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.references :company, index: true

      t.timestamps null: false
    end
  end
end
