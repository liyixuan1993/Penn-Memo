class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :Author
      t.string :Title
      t.date :date
      t.string :tag
      t.string :Content
      t.string :file

      t.timestamps
    end
  end
end
