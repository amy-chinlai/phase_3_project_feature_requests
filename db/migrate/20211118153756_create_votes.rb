class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :request_id
      t.integer :vote_type

      t.timestamps
    end
  end
end
