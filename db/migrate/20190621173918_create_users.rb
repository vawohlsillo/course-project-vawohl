class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :biography
      t.string :sex
      t.boolean :suspended
      t.string :role
      t.string :city
      t.string :country
      t.timestamps
    end
  end
end
