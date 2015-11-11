class User < ActiveRecord::Base
  belongs_to :topic
  #has_many :follows, class_name: "Follow", foreign_key: :follower_id
  #has_many :follows, class_name: "Follow", foreign_key: :followee_id
  has_many :followers, class_name: 'Follow', :foreign_key => 'follower_id'
  has_many :followees, class_name: 'Follow', :foreign_key => 'followee_id'
  validates :fname, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :lname, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :email, presence: true, uniqueness: true
  validates_inclusion_of :doctor, :in => [true, false]
end
