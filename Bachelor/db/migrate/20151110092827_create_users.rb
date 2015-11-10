class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :type
      t.string :email
      t.string :gucid
      t.string :fname
      t.string :lname
      t.date :dob
      t.boolean :gender
      t.string :location
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
