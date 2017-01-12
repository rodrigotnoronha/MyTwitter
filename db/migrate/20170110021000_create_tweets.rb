class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :message, limit: 144
      t.belongs_to :user, index: :true
      t.timestamps null: false
    end
  end
end
