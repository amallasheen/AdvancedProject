class Topic < ActiveRecord::Base
  belongs_to :category
  has_one :user

  validates_presence_of(:category_id)
  validates_presence_of(:name)
end
