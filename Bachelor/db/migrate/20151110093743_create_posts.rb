class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :desttype
      t.references :user, index: true, foreign_key: true
      t.integer :destid
      t.text :content

      t.timestamps null: false
    end
  end
end
