class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :blacklist, foreign_key: true
      t.string :name
      t.text :biography
      t.string :sex
      t.boolean :suspended
      t.string :role
      t.timestamps
    end
  end
end
