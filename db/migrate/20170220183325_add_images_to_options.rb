class AddImagesToOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :photo_1, :string
    add_column :questions, :photo_2, :string
  end
end
