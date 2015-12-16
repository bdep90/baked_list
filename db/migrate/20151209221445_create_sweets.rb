class CreateSweets < ActiveRecord::Migration
  def change
    create_table :sweets do |t|
      t.string :name
      t.string :img
      t.string :description
      t.string :bakery_name
      t.string :bakery_location
      t.integer :rating
      t.belongs_to :user

      t.timestamps
    end
  end
end
