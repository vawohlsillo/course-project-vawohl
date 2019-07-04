class CreateInappropiateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :inappropiate_comments do |t|
      t.string :justification
      t.references :comment, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
