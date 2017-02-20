class AddQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.column :content, :string
      t.column :option_1, :string
      t.column :option_2, :string

      t.timestamps
    end

    create_table :responses do |t|
      t.column :question_id, :integer
      t.column :option_1, :boolean, :default => false
      t.column :option_2, :boolean, :default => false

      t.timestamps
    end
  end
end
