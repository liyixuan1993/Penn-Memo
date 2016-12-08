class CreateUnreads < ActiveRecord::Migration[5.0]
  def change
    create_table :unreads do |t|
      t.references :memo, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :notification

      t.timestamps
    end
  end
end
