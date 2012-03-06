class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :item_id
      t.string :url
      t.string :title
      t.integer :state
      t.string :shortlink
      t.string :source
      t.datetime :time_added
      t.datetime :time_updated
      t.integer :user_id
      
      t.timestamps
    end
  end
end
