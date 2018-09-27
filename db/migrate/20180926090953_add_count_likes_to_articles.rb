class AddCountLikesToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :count_likes, :integer, :default =>  0
  end
end
