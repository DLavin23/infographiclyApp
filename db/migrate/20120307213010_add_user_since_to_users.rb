class AddUserSinceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_since, :datetime

    add_column :users, :count_list, :integer

    add_column :users, :count_read, :integer

    add_column :users, :count_unread, :integer

  end
end
