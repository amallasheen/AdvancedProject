class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
     # t.references :user, index: true, foreign_key: true
     # t.references :user, index: true, foreign_key: true
      t.integer :follower_id
      t.integer :followee_id
      t.timestamps null: false
    end
    execute "alter table follows add foreign key(follower_id) references users(id)"
     execute "alter table follows add foreign key(follower_id) references users(id)"
    execute "alter table follows add foreign key(followee_id) references users(id)"
  end
end
