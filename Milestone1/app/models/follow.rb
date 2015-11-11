class Follow < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'
  validates_presence_of(:follower_id)
  validates_presence_of(:followee_id)
  validates_uniqueness_of :follower_id, :scope => [:followee_id]
  validate :different_user


  def different_user
  	if follower_id == followee_id
  		errors.add(:follower_id, "can't follow themselves")
  	end
  end

end
