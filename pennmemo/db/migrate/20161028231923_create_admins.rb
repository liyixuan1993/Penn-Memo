class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :title
      t.string :author
      t.date :date
      t.string :tag
      t.text :content
      t.string :attachment

      t.timestamps
    end
  end
end
