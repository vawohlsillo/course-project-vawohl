class CreateInappropiatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :inappropiate_posts do |t|
      t.string :justification

      t.timestamps
    end
  end
end
