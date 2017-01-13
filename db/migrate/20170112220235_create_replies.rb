class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.belongs_to :tweet
      t.belongs_to :tweet_reply
      t.timestamps null: false
    end
  end
end
