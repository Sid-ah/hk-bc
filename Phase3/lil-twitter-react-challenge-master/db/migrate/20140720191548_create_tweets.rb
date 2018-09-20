class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |column|
      column.string :content, :username, :handle, :avatar_url
      column.timestamps
    end
  end
end
