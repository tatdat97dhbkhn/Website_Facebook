class AddWatchedToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :watched, :integer, :default =>  0
  end
end
