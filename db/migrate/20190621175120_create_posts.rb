class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :inappropiate_post, foreign_key: true
      t.string :title
      t.text :description
      t.integer :like
      t.integer :unlike
      t.boolean :solve_status
      t.boolean :hide
      t.integer :inappropiate_counter
      t.timestamps
    end
  end
end
