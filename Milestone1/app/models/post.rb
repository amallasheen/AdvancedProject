class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :comments
  validates_presence_of(:content)
  validates_presence_of(:user_id)
end
