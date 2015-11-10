class User < ActiveRecord::Base
  belongs_to :topic
  has_many :follows, class_name: "Follow", foreign_key: :follower_id
  has_many :follows, class_name: "Follow", foreign_key: :followee_id
end
