class CreateProbandos < ActiveRecord::Migration[5.2]
  def change
    create_table :probandos do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :parragraph
      t.integer :number

      t.timestamps
    end
  end
end
