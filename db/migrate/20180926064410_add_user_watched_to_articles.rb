class AddUserWatchedToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :user_watched, :integer, :default =>  0
  end
end
