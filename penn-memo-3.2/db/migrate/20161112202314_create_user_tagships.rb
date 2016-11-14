class CreateUserTagships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tagships do |t|
      t.integer :user_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
