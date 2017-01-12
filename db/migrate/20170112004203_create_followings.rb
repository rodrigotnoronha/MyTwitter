class CreateFollowings < ActiveRecord::Migration[5.0]
  def change
    create_table :followings do |t|
      t.belongs_to :user
      t.belongs_to :follower

      t.timestamps null: false
    end
  end
end
