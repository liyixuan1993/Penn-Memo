class CreateResponds < ActiveRecord::Migration[5.0]
  def change
    create_table :responds do |t|
      t.integer :user_id
      t.integer :memo_id
      t.string :respond_content

      t.timestamps
    end
  end
end
