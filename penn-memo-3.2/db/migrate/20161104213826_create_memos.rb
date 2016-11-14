class CreateMemos < ActiveRecord::Migration[5.0]
  def change
    create_table :memos do |t|
      t.string :title
      t.string :author
      t.date :date
      t.text :content
      t.string :priority

      t.timestamps
    end
  end
end
