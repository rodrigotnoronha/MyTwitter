class CreateRetweets < ActiveRecord::Migration[5.0]
  def change
    create_table :retweets do |t|
      t.belongs_to :tweet
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
