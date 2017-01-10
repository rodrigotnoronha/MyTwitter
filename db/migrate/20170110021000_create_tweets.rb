class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :message, limit: 144

      t.timestamps
    end
  end
end
