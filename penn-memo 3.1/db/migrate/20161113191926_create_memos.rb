class CreateMemos < ActiveRecord::Migration[5.0]
  def change
    create_table :memos do |t|
      t.string :title
      t.string :author
      t.date :date
      t.text :content
      t.boolean :priority
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
