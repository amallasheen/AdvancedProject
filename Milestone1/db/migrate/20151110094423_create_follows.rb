class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :follower
      t.references :followee

      t.timestamps null: false
    end
  end
end
