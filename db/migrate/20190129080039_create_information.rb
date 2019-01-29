class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.string :title
      t.text :comment
      t.boolean :general
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :information, :users
  end
end
