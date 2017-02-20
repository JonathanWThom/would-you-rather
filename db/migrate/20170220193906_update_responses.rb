class UpdateResponses < ActiveRecord::Migration[5.0]
  def change
    add_column :responses, :user_id, :integer
    add_column :responses, :comment, :string
  end
end
