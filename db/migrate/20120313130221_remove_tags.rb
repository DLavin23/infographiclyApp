class RemoveTags < ActiveRecord::Migration
  def up
    drop_table :tags
  end

  def down
    create_table :tags do |t|
      t.string :name
      t.integer :user_id
      t.integer :article_id
 
      t.timestamps
    end
  end
end
