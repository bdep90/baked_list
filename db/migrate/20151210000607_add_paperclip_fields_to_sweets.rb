class AddPaperclipFieldsToSweets < ActiveRecord::Migration
  def change
    add_column :sweets, :image_file_name,    :string
    add_column :sweets, :image_content_type, :string
    add_column :sweets, :image_file_size,    :integer
    add_column :sweets, :image_updated_at,   :datetime
  end
end
