class AddQToSweets < ActiveRecord::Migration
  def change
    add_column :sweets, :q, :string
  end
end
