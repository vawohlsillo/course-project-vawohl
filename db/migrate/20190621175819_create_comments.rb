class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.references :inappropiate_comment, foreign_key: true
      t.text :description
      t.integer :inappropiate_counter
      t.boolean :hide

      t.timestamps
    end
  end
end
