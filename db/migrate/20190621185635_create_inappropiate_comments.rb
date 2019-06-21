class CreateInappropiateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :inappropiate_comments do |t|
      t.string :justification

      t.timestamps
    end
  end
end
