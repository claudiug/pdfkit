class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :name
      t.string :email
      t.string :key
      t.string :link
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
  end
end
