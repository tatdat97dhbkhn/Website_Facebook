class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.string :user_id
      t.string :integer
      t.string :following_id
      t.string :integer

      t.timestamps
    end
  end
end
