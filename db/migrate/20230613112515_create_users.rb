class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :photo, null: false, default: ""
      t.text :bio, null: false, default: ""
      t.integer :posts_counter, null: false, default: 0

      t.timestamps
    end
  end
end
