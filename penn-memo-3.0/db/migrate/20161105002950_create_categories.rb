class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end

    add_column :memos, :category_id, :integer
    add_index :memos, :category_id
  end
end